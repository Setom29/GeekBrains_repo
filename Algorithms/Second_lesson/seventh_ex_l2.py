"""7. Написать программу, доказывающую или проверяющую, что для множества натуральных чисел выполняется равенство:
1+2+...+n = n(n+1)/2, где n — любое натуральное число."""
n = int(input('Введите n: '))
ans = n * (n + 1) / 2
i = 0
summ = 0
while i <= n:
    summ += i
    i += 1
print(f'Сумма ряда натуральных чисел до {n} = {summ}\n'
      f'{n} * ({n} + 1) / 2 = {ans}')