.data
	Message: .asciiz "Nhap vao so nguyen: "
	khong:  .asciiz "khong "
	mot:	.asciiz "mot "
	hai:	.asciiz "hai "
	ba:	.asciiz "ba "
	bon:	.asciiz "bon "
	nam:	.asciiz  "nam "
	sau:	.asciiz "sau "
	bay:	.asciiz "bay "
	tam:	.asciiz "tam "
	chin:	.asciiz "chin "
	muoi:	.asciiz "muoi "
	tram:	.asciiz "tram "
	nghin:	.asciiz "nghin "
	trieu:	.asciiz "trieu "
	le:	.asciiz "le "
	k_tram:	.asciiz "khong tram "
	error: .asciiz "Gia tri nhap vap khong hop le"
.text
main:
	
	li $v0, 4
	la $a0, Message
	syscall				# In ra Message
	li $v0, 5
	syscall
	add $s0, $v0, $zero		# Doc vao so nguyen
	bne $s0, $zero, hangtrieu	
	jal print0			# Neu so nguyen bang 0 thi in ra man hinh roi ket thuc
	j Exit
endmain:


hangtrieu:
	li $s1, 1000000			# Chia so nguyen cho 1 trieu de lay 3 chu so hang trieu
 	div $s0, $s1
 	mfhi $s0
 	mflo $t1
	jal hangtram			# Chuyen doi so hang trieu va in ra man hinh
	beq $t1, $zero, hangnghin	# Neu khong co so hang trieu thi chuyen sang hang nghin
	jal print1000000		# In  "trieu" ra man hinh
	li $t6, 1			# Danh dau so lon hon 1 trieu
hangnghin:
	li $s1, 1000			# Lay 3 chu so hang nghin
 	div $s0, $s1
 	mfhi $s0
 	mflo $t1
 	li $t4, 100			# Kiem tra so hang nghin be hon 100 va lon hon 0
 	slt $t3, $t1, $t4
 	slt $s3, $zero, $t1
 	bne $t3, $s3, n1		# Neu khong thoa man dieu kien thi bo qua
 	bne $t3, $t6, n1
 	jal print0tram			# Neu so hang tram bang 0 thi in khong tram ra man hinh
n1:	jal hangtram			# Chuyen doi so hang nghin va in ra man hinh
	beq $t1, $zero, hangdonvi	# Neu khong co so hang nghin thi chuyen sang hang don vi
	li $t7, 1			# Danh dau so lon hon 1000
	li $t8, 1			# Danh dau de in "le" ra man hinh
	jal print1000			# In  "nghin" ra man hinh
hangdonvi:
	add $t1, $s0, $zero		# lay ra 3 chu so hang don vi
	li $t4, 100			# kiem tra lon hon 0 va nho hon 100
 	slt $t3, $t1, $t4		
 	slt $s3, $zero, $t1
 	bne $t3, $s3, h1		# Neu khong thoa man bo qua
 	beq $t3, $t6, h2		# Neu so lon hon 1 trieu thi in "khong tram"
 	bne $t3, $t7, h1		# Neu so nho hon 1000 thi bo qua
h2: 	jal print0tram			# In "khong tram" ra man h�nh
h1:	jal hangtram			# In cac chu so hang don vi
	j Exit				# Nhay den ket thuc chuong trinh
hangtram:
	add $t9, $ra, $zero		# Luu lai thanh ghi $ra
	div $t1, $s1
	mfhi $t2		
	mflo $t0			# Lay ra chu so hang tram
	beq $t0, $zero, hangchuc	# neu chu so hang tram bang 0 thi nhay toi hang chuc
	jal print			# in chu so hang tram
	jal print100			# in " tram " ra man hinh
	li $t8, 1
				# danh de in "le" ra man hinh
hangchuc:
	li $s1, 10			# lay chu so hang chuc
	div $t2, $s1
	mfhi $t2
	mflo $t0
	beq $t0, 1, c1			# neu chu so hang chuc bang 1 thi in muoi
	beq $t0, $zero, donvi		# neu chu so hang chuc bang 0 thi bo qua
	jal print
				# in so hang chuc ra man hinh
c1:	jal print10			# in " muoi" ra man hinh
	li $t8, 0			# danh dau khong in " le" ra man hinh

donvi:
	li $s1, 1			# Doc chu so hang don vi
	div $t2, $s1
	mfhi $t2
	mflo $t0
	beq $t0, $zero, d1		# neu bang 0 thi tro ve chuong trinh main
	bne $t8, 1, d2			# neu co danh dau khong in "le" ra man hinh th� bo qua
	jal printle			# in "le" ra man hinh
d2:	jal print			# in so hang don vi ra man hinh
	li $t8 , 1			# gan co khong in le
d1:	jr $t9	

#Cac ham chuc nang in		
print:		
	beq $t0, 1, print1		# chon lenh de in cac so ra man hinh
	beq $t0, 2, print2
	beq $t0, 3, print3
	beq $t0, 4, print4
	beq $t0, 5, print5
	beq $t0, 6, print6
	beq $t0, 7, print7
	beq $t0, 8, print8
	beq $t0, 9, print9
print0:	
	li $v0, 4			# in "khong" ra man hinh
	la $a0, khong
	syscall
	jr $ra
print1:
	li $v0, 4			# in "mot" ra man hinh
	la $a0, mot
	syscall
	jr $ra	
print2:					# in "hai" ra man hinh
	li $v0, 4
	la $a0, hai
	syscall
	jr $ra	
print3:					# in "ba" ra man hinh
	li $v0, 4
	la $a0, ba
	syscall
	jr $ra	
print4:					# in "bon" ra man hinh
	li $v0, 4
	la $a0, bon
	syscall
	jr $ra	
print5:					# in "nam" ra man hinh
	li $v0, 4
	la $a0, nam
	syscall
	jr $ra	
print6:					# in "sau" ra man hinh
	li $v0, 4
	la $a0, sau
	syscall	
	jr $ra
print7:					# in "bay" ra man hinh
	li $v0, 4
	la $a0, bay
	syscall
	jr $ra	
print8:					# in "tam" ra man hinh
	li $v0, 4
	la $a0, tam
	syscall
	jr $ra	
print9:					# in "chin" ra man hinh
	li $v0, 4
	la $a0, chin
	syscall
	jr $ra
print10:				# in "muoi" ra man hinh
	li $v0, 4
	la $a0, muoi
	syscall
	jr $ra
print100:				# in "tram" ra man hinh
	li $v0, 4
	la $a0, tram
	syscall
	jr $ra
print1000:				# in "nghin" ra man hinh
	li $v0, 4
	la $a0, nghin
	syscall
	jr $ra	
print1000000:				# in "trieu" ra man hinh
	li $v0, 4
	la $a0, trieu
	syscall
	jr $ra	
printle:				# in "le" ra man hinh
	li $v0, 4
	la $a0, le
	syscall
	jr $ra	
print0tram:				# in "khong tram" ra man hinh
	li $v0, 4
	la $a0, k_tram
	syscall
	jr $ra			
Exit:
	li $v0,10
	syscall					
