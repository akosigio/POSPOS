from pickle import FALSE
from django.shortcuts import redirect, get_object_or_404, render
from django.http import HttpResponse
from flask import jsonify
from posApp.models import Category, Products, Sales, salesItems
from django.db.models import Count, Sum
from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.shortcuts import redirect
import json, sys
from datetime import date, datetime
from django.http import JsonResponse
from .models import Products, Category
from django.views.decorators.csrf import csrf_exempt
from .models import Expense
from django.db.models.functions import TruncMonth, TruncYear
# Login


 

def login_user(request):
    logout(request)
    resp = {"status":'failed','msg':''}
    username = ''
    password = ''
    if request.POST:
        username = request.POST['username']
        password = request.POST['password']

        user = authenticate(username=username, password=password)
        if user is not None:
            if user.is_active:
                login(request, user)
                resp['status']='success'
            else:
                resp['msg'] = "Incorrect username or password"
        else:
            resp['msg'] = "Incorrect username or password"
    return HttpResponse(json.dumps(resp),content_type='application/json')

#Logout
def logoutuser(request):
    logout(request)
    return redirect('/')

# Create your views here.
@login_required
def home(request):
    now = datetime.now()
    current_year = now.strftime("%Y")
    current_month = now.strftime("%m")
    current_day = now.strftime("%d")

    monthly_expenses = Expense.objects.annotate(month=TruncMonth('date')).values('month').annotate(total=Sum('amount'))
    yearly_expenses = Expense.objects.annotate(year=TruncYear('date')).values('year').annotate(total=Sum('amount'))

    total_monthly_expenses = Expense.objects.filter(
        date__year=current_year,
        date__month=current_month
    ).aggregate(Sum('amount'))['amount__sum'] or 0

    total_yearly_expenses = Expense.objects.filter(
        date__year=current_year
    ).aggregate(Sum('amount'))['amount__sum'] or 0
    daily_expenses = Expense.objects.filter(
        date__year=current_year,
        date__month=current_month,
        date__day=current_day
    )
    total_daily_expenses = daily_expenses.aggregate(Sum('amount'))['amount__sum'] or 0

    expense_count = Expense.objects.count()
    categories = len(Category.objects.all())
    products = len(Products.objects.all())
    transaction = len(Sales.objects.filter(
        date_added__year=current_year,
        date_added__month = current_month,
        date_added__day = current_day
    ))
    today_sales = Sales.objects.filter(
        date_added__year=current_year,
        date_added__month = current_month,
        date_added__day = current_day
    ).all()
    total_sales = sum(today_sales.values_list('grand_total',flat=True))
    context = {
        'page_title':'Home',
        'categories' : categories,
        'products' : products,
        'transaction' : transaction,
        'total_sales' : total_sales,
        'expense': expense_count,
        'monthly_expenses': monthly_expenses,
        'yearly_expenses': yearly_expenses,
        'daily_expenses': daily_expenses,
        'total_daily_expenses': total_daily_expenses,
        'total_monthly_expenses': total_monthly_expenses,
        'total_yearly_expenses': total_yearly_expenses,
        
    }
    return render(request, 'posApp/home.html',context)


def about(request):
    context = {
        'page_title':'About',
    }
    return render(request, 'posApp/about.html',context)

#Categories
@login_required
def category(request):
    category_list = Category.objects.all()
    # category_list = {}
    context = {
        'page_title':'Category List',
        'category':category_list,
    }
    return render(request, 'posApp/category.html',context)

@login_required
def manage_category(request):
    category = {}
    if request.method == 'GET':
        data =  request.GET
        id = ''
        if 'id' in data:
            id= data['id']
        if id.isnumeric() and int(id) > 0:
            category = Category.objects.filter(id=id).first()
    
    context = {
        'category' : category
    }
    return render(request, 'posApp/manage_category.html',context)

@login_required
def save_category(request):
    data =  request.POST
    resp = {'status':'failed'}
    try:
        if (data['id']).isnumeric() and int(data['id']) > 0 :
            save_category = Category.objects.filter(id = data['id']).update(name=data['name'], description = data['description'],status = data['status'])
        else:
            save_category = Category(name=data['name'], description = data['description'],status = data['status'])
            save_category.save()
        resp['status'] = 'success'
        messages.success(request, 'Category Successfully saved.')
    except:
        resp['status'] = 'failed'
    return HttpResponse(json.dumps(resp), content_type="application/json")

@login_required
def delete_category(request):
    data =  request.POST
    resp = {'status':''}
    try:
        Category.objects.filter(id = data['id']).delete()
        resp['status'] = 'success'
        messages.success(request, 'Category Successfully deleted.')
    except:
        resp['status'] = 'failed'
    return HttpResponse(json.dumps(resp), content_type="application/json")

# Products
@login_required
def products(request):
    product_list = Products.objects.all()
    context = {
        'page_title':'Product List',
        'products':product_list,
    }
    return render(request, 'posApp/products.html',context)

@login_required
def manage_products(request):
    product = {}
    categories = Category.objects.filter(status = 1).all()
    if request.method == 'GET':
        data =  request.GET
        id = ''
        if 'id' in data:
            id= data['id']
        if id.isnumeric() and int(id) > 0:
            product = Products.objects.filter(id=id).first()
    
    context = {
        'product' : product,
        'categories' : categories
    }
    return render(request, 'posApp/manage_product.html',context)

@login_required
def test(request):
    categories = Category.objects.all()
    context = {
        'categories' : categories
    }
    return render(request, 'posApp/test.html',context)

@login_required
def save_product(request):
    data = request.POST
    resp = {'status': 'failed'}

    try:
        product_id = data.get('id', None)  # Use data.get to avoid KeyError if 'id' is missing
        
        if product_id:
            product_id = int(product_id)
            product = Products.objects.filter(id=product_id).first()  # Use .first() to handle None gracefully
        else:
            product = Products()  # Create a new product instance
        
        # Validate and set attributes
        product.code = data['code']
        category = Category.objects.filter(id=data['category_id']).first()
        if not category:
            resp['msg'] = "Invalid Category ID"
            return JsonResponse(resp)

        product.category_id = category
        product.name = data['name']
        product.description = data['description']
        product.price = float(data['price'])
        product.status = data['status']
        product.quantity = int(data['quantity'])
        product.save()

        resp['status'] = 'success'
        resp['msg'] = 'Product Successfully saved.'
    except Exception as e:
        resp['msg'] = f"An error occurred: {str(e)}"

    return JsonResponse(resp)

@login_required
def delete_product(request):
    data = request.POST
    resp = {'status': ''}
    try:
        product_id = data.get('id')
        Products.objects.filter(id=product_id).delete()
        resp['status'] = 'success'
    except:
        resp['status'] = 'failed'
    return JsonResponse(resp)

@login_required
def pos(request):
    products = Products.objects.filter(status = 1)
    product_json = []
    for product in products:
        product_json.append({'id':product.id, 'name':product.name, 'price':float(product.price)})
    context = {
        'page_title' : "Point of Sale",
        'products' : products,
        'product_json' : json.dumps(product_json)
    }
    # return HttpResponse('')
    return render(request, 'posApp/pos.html',context)

@login_required
def checkout_modal(request):
    grand_total = 0
    if 'grand_total' in request.GET:
        grand_total = request.GET['grand_total']
    context = {
        'grand_total' : grand_total,
    }
    return render(request, 'posApp/checkout.html',context)

@login_required
def save_pos(request):
    resp = {'status':'failed','msg':''}
    data = request.POST
    pref = datetime.now().year + datetime.now().year
    i = 1
    while True:
        code = '{:0>5}'.format(i)
        i += int(1)
        check = Sales.objects.filter(code = str(pref) + str(code)).all()
        if len(check) <= 0:
            break
    code = str(pref) + str(code)

    try:
        sales = Sales(code=code, sub_total = data['sub_total'], tax = data['tax'], tax_amount = data['tax_amount'], grand_total = data['grand_total'], tendered_amount = data['tendered_amount'], amount_change = data['amount_change']).save()
        sale_id = Sales.objects.last().pk
        i = 0
        for prod in data.getlist('product_id[]'):
            product_id = prod 
            sale = Sales.objects.filter(id=sale_id).first()
            product = Products.objects.filter(id=product_id).first()
            qty = data.getlist('qty[]')[i] 
            product.quantity -= float(qty)
            product.save()                       
            price = data.getlist('price[]')[i] 
            total = float(qty) * float(price)
            print({'sale_id' : sale, 'product_id' : product, 'qty' : qty, 'price' : price, 'total' : total})
            salesItems(sale_id = sale, product_id = product, qty = qty, price = price, total = total).save()
            i += int(1)
        resp['status'] = 'success'
        resp['sale_id'] = sale_id
        messages.success(request, "Sale Record has been saved.")
    except:
        resp['msg'] = "An error occured"
        print("Unexpected error:", sys.exc_info()[0])
    return HttpResponse(json.dumps(resp),content_type="application/json")

@login_required
def salesList(request):
    sales = Sales.objects.all()
    sale_data = []
    for sale in sales:
        data = {}
        for field in sale._meta.get_fields(include_parents=False):
            if field.related_model is None:
                data[field.name] = getattr(sale,field.name)
        data['items'] = salesItems.objects.filter(sale_id = sale).all()
        data['item_count'] = len(data['items'])
        if 'tax_amount' in data:
            data['tax_amount'] = format(float(data['tax_amount']),'.2f')
        # print(data)
        sale_data.append(data)
    # print(sale_data)
    context = {
        'page_title':'Sales Transactions',
        'sale_data':sale_data,
    }
    # return HttpResponse('')
    return render(request, 'posApp/sales.html',context)

@login_required
def receipt(request):
    id = request.GET.get('id')
    sales = Sales.objects.filter(id = id).first()
    transaction = {}
    for field in Sales._meta.get_fields():
        if field.related_model is None:
            transaction[field.name] = getattr(sales,field.name)
    if 'tax_amount' in transaction:
        transaction['tax_amount'] = format(float(transaction['tax_amount']))
    ItemList = salesItems.objects.filter(sale_id = sales).all()
    context = {
        "transaction" : transaction,
        "salesItems" : ItemList
    }

    return render(request, 'posApp/receipt.html',context)
    # return HttpResponse('')

@login_required
def delete_sale(request):
    resp = {'status':'failed', 'msg':''}
    id = request.POST.get('id')
    try:
        delete = Sales.objects.filter(id = id).delete()
        resp['status'] = 'success'
        messages.success(request, 'Sale Record has been deleted.')
    except:
        resp['msg'] = "An error occured"
        print("Unexpected error:", sys.exc_info()[0])
    return HttpResponse(json.dumps(resp), content_type='application/json')

@login_required
def expenses_page(request):
    expenses = Expense.objects.all()
    context = {
        'expenses': expenses,
    }
    return render(request, 'posApp/expenses.html', context)

@login_required
def add_expense(request):
    if request.method == 'POST':
        amount = request.POST.get('amount')
        category = request.POST.get('category')
        description = request.POST.get('description')
        date = request.POST.get('date')
        expense = Expense(amount=amount, category=category, description=description, date=date)
        expense.save()
        return JsonResponse({'status': 'success'})

@login_required
def edit_expense(request, expense_id):
    expense = get_object_or_404(Expense, id=expense_id)

    if request.method == 'POST':
        amount = request.POST.get('amount')
        category = request.POST.get('category')
        description = request.POST.get('description')
        date = request.POST.get('date')

        # Update expense fields
        expense.amount = amount
        expense.category = category
        expense.description = description
        expense.date = date

        # Save the updated expense
        expense.save()

        return JsonResponse({'status': 'success'})
    else:
        context = {'expense': expense}
        return render(request, 'posApp/edit_expense.html', context)

@login_required
def delete_expense(request, expense_id):
    expense = Expense.objects.get(id=expense_id)
    expense.delete()
    return JsonResponse({'status': 'success'})

@login_required
def save_expense(request):
    if request.method == 'POST':
        # Extract expense data from the POST request
        amount = request.POST.get('amount')
        category = request.POST.get('category')
        description = request.POST.get('description')
        date = request.POST.get('date')

        # Create a new Expense object and save it to the database
        expense = Expense(amount=amount, category=category, description=description, date=date)
        expense.save()

        # Return a JSON response indicating success
        return JsonResponse({'status': 'success', 'msg': 'Expense saved successfully'})

    return JsonResponse({'status': 'failed', 'msg': 'Invalid request method'})