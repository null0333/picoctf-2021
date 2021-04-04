
otp:     file format elf64-x86-64


Disassembly of section .init:

00000000000005f8 <_init>:
 5f8:	48 83 ec 08          	sub    $0x8,%rsp
 5fc:	48 8b 05 e5 09 20 00 	mov    0x2009e5(%rip),%rax        # 200fe8 <__gmon_start__>
 603:	48 85 c0             	test   %rax,%rax
 606:	74 02                	je     60a <_init+0x12>
 608:	ff d0                	callq  *%rax
 60a:	48 83 c4 08          	add    $0x8,%rsp
 60e:	c3                   	retq   

Disassembly of section .plt:

0000000000000610 <.plt>:
 610:	ff 35 8a 09 20 00    	pushq  0x20098a(%rip)        # 200fa0 <_GLOBAL_OFFSET_TABLE_+0x8>
 616:	ff 25 8c 09 20 00    	jmpq   *0x20098c(%rip)        # 200fa8 <_GLOBAL_OFFSET_TABLE_+0x10>
 61c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000000620 <strncpy@plt>:
 620:	ff 25 8a 09 20 00    	jmpq   *0x20098a(%rip)        # 200fb0 <strncpy@GLIBC_2.2.5>
 626:	68 00 00 00 00       	pushq  $0x0
 62b:	e9 e0 ff ff ff       	jmpq   610 <.plt>

0000000000000630 <strncmp@plt>:
 630:	ff 25 82 09 20 00    	jmpq   *0x200982(%rip)        # 200fb8 <strncmp@GLIBC_2.2.5>
 636:	68 01 00 00 00       	pushq  $0x1
 63b:	e9 d0 ff ff ff       	jmpq   610 <.plt>

0000000000000640 <puts@plt>:
 640:	ff 25 7a 09 20 00    	jmpq   *0x20097a(%rip)        # 200fc0 <puts@GLIBC_2.2.5>
 646:	68 02 00 00 00       	pushq  $0x2
 64b:	e9 c0 ff ff ff       	jmpq   610 <.plt>

0000000000000650 <__stack_chk_fail@plt>:
 650:	ff 25 72 09 20 00    	jmpq   *0x200972(%rip)        # 200fc8 <__stack_chk_fail@GLIBC_2.4>
 656:	68 03 00 00 00       	pushq  $0x3
 65b:	e9 b0 ff ff ff       	jmpq   610 <.plt>

0000000000000660 <printf@plt>:
 660:	ff 25 6a 09 20 00    	jmpq   *0x20096a(%rip)        # 200fd0 <printf@GLIBC_2.2.5>
 666:	68 04 00 00 00       	pushq  $0x4
 66b:	e9 a0 ff ff ff       	jmpq   610 <.plt>

Disassembly of section .plt.got:

0000000000000670 <__cxa_finalize@plt>:
 670:	ff 25 82 09 20 00    	jmpq   *0x200982(%rip)        # 200ff8 <__cxa_finalize@GLIBC_2.2.5>
 676:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000000680 <_start>:
 680:	31 ed                	xor    %ebp,%ebp
 682:	49 89 d1             	mov    %rdx,%r9
 685:	5e                   	pop    %rsi
 686:	48 89 e2             	mov    %rsp,%rdx
 689:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
 68d:	50                   	push   %rax
 68e:	54                   	push   %rsp
 68f:	4c 8d 05 da 03 00 00 	lea    0x3da(%rip),%r8        # a70 <__libc_csu_fini>
 696:	48 8d 0d 63 03 00 00 	lea    0x363(%rip),%rcx        # a00 <__libc_csu_init>
 69d:	48 8d 3d 6a 01 00 00 	lea    0x16a(%rip),%rdi        # 80e <main>
 6a4:	ff 15 36 09 20 00    	callq  *0x200936(%rip)        # 200fe0 <__libc_start_main@GLIBC_2.2.5>
 6aa:	f4                   	hlt    
 6ab:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

00000000000006b0 <deregister_tm_clones>:
 6b0:	48 8d 3d 59 09 20 00 	lea    0x200959(%rip),%rdi        # 201010 <__TMC_END__>
 6b7:	55                   	push   %rbp
 6b8:	48 8d 05 51 09 20 00 	lea    0x200951(%rip),%rax        # 201010 <__TMC_END__>
 6bf:	48 39 f8             	cmp    %rdi,%rax
 6c2:	48 89 e5             	mov    %rsp,%rbp
 6c5:	74 19                	je     6e0 <deregister_tm_clones+0x30>
 6c7:	48 8b 05 0a 09 20 00 	mov    0x20090a(%rip),%rax        # 200fd8 <_ITM_deregisterTMCloneTable>
 6ce:	48 85 c0             	test   %rax,%rax
 6d1:	74 0d                	je     6e0 <deregister_tm_clones+0x30>
 6d3:	5d                   	pop    %rbp
 6d4:	ff e0                	jmpq   *%rax
 6d6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 6dd:	00 00 00 
 6e0:	5d                   	pop    %rbp
 6e1:	c3                   	retq   
 6e2:	0f 1f 40 00          	nopl   0x0(%rax)
 6e6:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 6ed:	00 00 00 

00000000000006f0 <register_tm_clones>:
 6f0:	48 8d 3d 19 09 20 00 	lea    0x200919(%rip),%rdi        # 201010 <__TMC_END__>
 6f7:	48 8d 35 12 09 20 00 	lea    0x200912(%rip),%rsi        # 201010 <__TMC_END__>
 6fe:	55                   	push   %rbp
 6ff:	48 29 fe             	sub    %rdi,%rsi
 702:	48 89 e5             	mov    %rsp,%rbp
 705:	48 c1 fe 03          	sar    $0x3,%rsi
 709:	48 89 f0             	mov    %rsi,%rax
 70c:	48 c1 e8 3f          	shr    $0x3f,%rax
 710:	48 01 c6             	add    %rax,%rsi
 713:	48 d1 fe             	sar    %rsi
 716:	74 18                	je     730 <register_tm_clones+0x40>
 718:	48 8b 05 d1 08 20 00 	mov    0x2008d1(%rip),%rax        # 200ff0 <_ITM_registerTMCloneTable>
 71f:	48 85 c0             	test   %rax,%rax
 722:	74 0c                	je     730 <register_tm_clones+0x40>
 724:	5d                   	pop    %rbp
 725:	ff e0                	jmpq   *%rax
 727:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
 72e:	00 00 
 730:	5d                   	pop    %rbp
 731:	c3                   	retq   
 732:	0f 1f 40 00          	nopl   0x0(%rax)
 736:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 73d:	00 00 00 

0000000000000740 <__do_global_dtors_aux>:
 740:	80 3d c9 08 20 00 00 	cmpb   $0x0,0x2008c9(%rip)        # 201010 <__TMC_END__>
 747:	75 2f                	jne    778 <__do_global_dtors_aux+0x38>
 749:	48 83 3d a7 08 20 00 	cmpq   $0x0,0x2008a7(%rip)        # 200ff8 <__cxa_finalize@GLIBC_2.2.5>
 750:	00 
 751:	55                   	push   %rbp
 752:	48 89 e5             	mov    %rsp,%rbp
 755:	74 0c                	je     763 <__do_global_dtors_aux+0x23>
 757:	48 8b 3d aa 08 20 00 	mov    0x2008aa(%rip),%rdi        # 201008 <__dso_handle>
 75e:	e8 0d ff ff ff       	callq  670 <__cxa_finalize@plt>
 763:	e8 48 ff ff ff       	callq  6b0 <deregister_tm_clones>
 768:	c6 05 a1 08 20 00 01 	movb   $0x1,0x2008a1(%rip)        # 201010 <__TMC_END__>
 76f:	5d                   	pop    %rbp
 770:	c3                   	retq   
 771:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
 778:	f3 c3                	repz retq 
 77a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000000780 <frame_dummy>:
 780:	55                   	push   %rbp
 781:	48 89 e5             	mov    %rsp,%rbp
 784:	5d                   	pop    %rbp
 785:	e9 66 ff ff ff       	jmpq   6f0 <register_tm_clones>

000000000000078a <valid_char>:
 78a:	55                   	push   %rbp
 78b:	48 89 e5             	mov    %rsp,%rbp
 78e:	89 f8                	mov    %edi,%eax
 790:	88 45 fc             	mov    %al,-0x4(%rbp)
 793:	80 7d fc 2f          	cmpb   $0x2f,-0x4(%rbp)
 797:	7e 0d                	jle    7a6 <valid_char+0x1c>
 799:	80 7d fc 39          	cmpb   $0x39,-0x4(%rbp)
 79d:	7f 07                	jg     7a6 <valid_char+0x1c>
 79f:	b8 01 00 00 00       	mov    $0x1,%eax
 7a4:	eb 18                	jmp    7be <valid_char+0x34>
 7a6:	80 7d fc 60          	cmpb   $0x60,-0x4(%rbp)
 7aa:	7e 0d                	jle    7b9 <valid_char+0x2f>
 7ac:	80 7d fc 66          	cmpb   $0x66,-0x4(%rbp)
 7b0:	7f 07                	jg     7b9 <valid_char+0x2f>
 7b2:	b8 01 00 00 00       	mov    $0x1,%eax
 7b7:	eb 05                	jmp    7be <valid_char+0x34>
 7b9:	b8 00 00 00 00       	mov    $0x0,%eax
 7be:	5d                   	pop    %rbp
 7bf:	c3                   	retq   

00000000000007c0 <jumble>:
 7c0:	55                   	push   %rbp
 7c1:	48 89 e5             	mov    %rsp,%rbp
 7c4:	89 f8                	mov    %edi,%eax
 7c6:	88 45 fc             	mov    %al,-0x4(%rbp)
 7c9:	80 7d fc 60          	cmpb   $0x60,-0x4(%rbp)
 7cd:	7e 0a                	jle    7d9 <jumble+0x19>
 7cf:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
 7d3:	83 c0 09             	add    $0x9,%eax
 7d6:	88 45 fc             	mov    %al,-0x4(%rbp)
 7d9:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
 7dd:	89 c2                	mov    %eax,%edx
 7df:	c0 fa 07             	sar    $0x7,%dl
 7e2:	c0 ea 04             	shr    $0x4,%dl
 7e5:	01 d0                	add    %edx,%eax
 7e7:	83 e0 0f             	and    $0xf,%eax
 7ea:	29 d0                	sub    %edx,%eax
 7ec:	88 45 fc             	mov    %al,-0x4(%rbp)
 7ef:	0f be 45 fc          	movsbl -0x4(%rbp),%eax
 7f3:	01 c0                	add    %eax,%eax
 7f5:	88 45 fc             	mov    %al,-0x4(%rbp)
 7f8:	80 7d fc 0f          	cmpb   $0xf,-0x4(%rbp)
 7fc:	7e 0a                	jle    808 <jumble+0x48>
 7fe:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
 802:	83 c0 01             	add    $0x1,%eax
 805:	88 45 fc             	mov    %al,-0x4(%rbp)
 808:	0f b6 45 fc          	movzbl -0x4(%rbp),%eax
 80c:	5d                   	pop    %rbp
 80d:	c3                   	retq   

000000000000080e <main>:
 80e:	55                   	push   %rbp
 80f:	48 89 e5             	mov    %rsp,%rbp
 812:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
 819:	89 bd 0c ff ff ff    	mov    %edi,-0xf4(%rbp)
 81f:	48 89 b5 00 ff ff ff 	mov    %rsi,-0x100(%rbp)
 826:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
 82d:	00 00 
 82f:	48 89 45 f8          	mov    %rax,-0x8(%rbp)
 833:	31 c0                	xor    %eax,%eax
 835:	83 bd 0c ff ff ff 01 	cmpl   $0x1,-0xf4(%rbp)
 83c:	7f 28                	jg     866 <main+0x58>
 83e:	48 8b 85 00 ff ff ff 	mov    -0x100(%rbp),%rax
 845:	48 8b 00             	mov    (%rax),%rax
 848:	48 89 c6             	mov    %rax,%rsi
 84b:	48 8d 3d 36 02 00 00 	lea    0x236(%rip),%rdi        # a88 <_IO_stdin_used+0x8>
 852:	b8 00 00 00 00       	mov    $0x0,%eax
 857:	e8 04 fe ff ff       	callq  660 <printf@plt>
 85c:	b8 01 00 00 00       	mov    $0x1,%eax
 861:	e9 84 01 00 00       	jmpq   9ea <main+0x1dc>
 866:	48 8b 85 00 ff ff ff 	mov    -0x100(%rbp),%rax
 86d:	48 83 c0 08          	add    $0x8,%rax
 871:	48 8b 08             	mov    (%rax),%rcx
 874:	48 8d 85 20 ff ff ff 	lea    -0xe0(%rbp),%rax
 87b:	ba 64 00 00 00       	mov    $0x64,%edx
 880:	48 89 ce             	mov    %rcx,%rsi
 883:	48 89 c7             	mov    %rax,%rdi
 886:	e8 95 fd ff ff       	callq  620 <strncpy@plt>
 88b:	c6 45 84 00          	movb   $0x0,-0x7c(%rbp)
 88f:	c7 85 18 ff ff ff 00 	movl   $0x0,-0xe8(%rbp)
 896:	00 00 00 
 899:	e9 9e 00 00 00       	jmpq   93c <main+0x12e>
 89e:	83 bd 18 ff ff ff 00 	cmpl   $0x0,-0xe8(%rbp)
 8a5:	75 3d                	jne    8e4 <main+0xd6>
 8a7:	8b 85 18 ff ff ff    	mov    -0xe8(%rbp),%eax
 8ad:	48 98                	cltq   
 8af:	0f b6 84 05 20 ff ff 	movzbl -0xe0(%rbp,%rax,1),%eax
 8b6:	ff 
 8b7:	0f be c0             	movsbl %al,%eax
 8ba:	89 c7                	mov    %eax,%edi
 8bc:	e8 ff fe ff ff       	callq  7c0 <jumble>
 8c1:	89 c2                	mov    %eax,%edx
 8c3:	89 d0                	mov    %edx,%eax
 8c5:	c0 f8 07             	sar    $0x7,%al
 8c8:	c0 e8 04             	shr    $0x4,%al
 8cb:	01 c2                	add    %eax,%edx
 8cd:	83 e2 0f             	and    $0xf,%edx
 8d0:	29 c2                	sub    %eax,%edx
 8d2:	89 d0                	mov    %edx,%eax
 8d4:	89 c2                	mov    %eax,%edx
 8d6:	8b 85 18 ff ff ff    	mov    -0xe8(%rbp),%eax
 8dc:	48 98                	cltq   
 8de:	88 54 05 90          	mov    %dl,-0x70(%rbp,%rax,1)
 8e2:	eb 51                	jmp    935 <main+0x127>
 8e4:	8b 85 18 ff ff ff    	mov    -0xe8(%rbp),%eax
 8ea:	48 98                	cltq   
 8ec:	0f b6 84 05 20 ff ff 	movzbl -0xe0(%rbp,%rax,1),%eax
 8f3:	ff 
 8f4:	0f be c0             	movsbl %al,%eax
 8f7:	89 c7                	mov    %eax,%edi
 8f9:	e8 c2 fe ff ff       	callq  7c0 <jumble>
 8fe:	0f be d0             	movsbl %al,%edx
 901:	8b 85 18 ff ff ff    	mov    -0xe8(%rbp),%eax
 907:	83 e8 01             	sub    $0x1,%eax
 90a:	48 98                	cltq   
 90c:	0f b6 44 05 90       	movzbl -0x70(%rbp,%rax,1),%eax
 911:	0f be c0             	movsbl %al,%eax
 914:	01 c2                	add    %eax,%edx
 916:	89 d0                	mov    %edx,%eax
 918:	c1 f8 1f             	sar    $0x1f,%eax
 91b:	c1 e8 1c             	shr    $0x1c,%eax
 91e:	01 c2                	add    %eax,%edx
 920:	83 e2 0f             	and    $0xf,%edx
 923:	29 c2                	sub    %eax,%edx
 925:	89 d0                	mov    %edx,%eax
 927:	89 c2                	mov    %eax,%edx
 929:	8b 85 18 ff ff ff    	mov    -0xe8(%rbp),%eax
 92f:	48 98                	cltq   
 931:	88 54 05 90          	mov    %dl,-0x70(%rbp,%rax,1)
 935:	83 85 18 ff ff ff 01 	addl   $0x1,-0xe8(%rbp)
 93c:	8b 85 18 ff ff ff    	mov    -0xe8(%rbp),%eax
 942:	48 98                	cltq   
 944:	0f b6 84 05 20 ff ff 	movzbl -0xe0(%rbp,%rax,1),%eax
 94b:	ff 
 94c:	0f be c0             	movsbl %al,%eax
 94f:	89 c7                	mov    %eax,%edi
 951:	e8 34 fe ff ff       	callq  78a <valid_char>
 956:	85 c0                	test   %eax,%eax
 958:	0f 85 40 ff ff ff    	jne    89e <main+0x90>
 95e:	c7 85 1c ff ff ff 00 	movl   $0x0,-0xe4(%rbp)
 965:	00 00 00 
 968:	eb 25                	jmp    98f <main+0x181>
 96a:	8b 85 1c ff ff ff    	mov    -0xe4(%rbp),%eax
 970:	48 98                	cltq   
 972:	0f b6 44 05 90       	movzbl -0x70(%rbp,%rax,1),%eax
 977:	83 c0 61             	add    $0x61,%eax
 97a:	89 c2                	mov    %eax,%edx
 97c:	8b 85 1c ff ff ff    	mov    -0xe4(%rbp),%eax
 982:	48 98                	cltq   
 984:	88 54 05 90          	mov    %dl,-0x70(%rbp,%rax,1)
 988:	83 85 1c ff ff ff 01 	addl   $0x1,-0xe4(%rbp)
 98f:	8b 85 1c ff ff ff    	mov    -0xe4(%rbp),%eax
 995:	3b 85 18 ff ff ff    	cmp    -0xe8(%rbp),%eax
 99b:	7c cd                	jl     96a <main+0x15c>
 99d:	83 bd 18 ff ff ff 64 	cmpl   $0x64,-0xe8(%rbp)
 9a4:	75 20                	jne    9c6 <main+0x1b8>
 9a6:	8b 85 18 ff ff ff    	mov    -0xe8(%rbp),%eax
 9ac:	48 63 d0             	movslq %eax,%rdx
 9af:	48 8d 45 90          	lea    -0x70(%rbp),%rax
 9b3:	48 8d 35 e6 00 00 00 	lea    0xe6(%rip),%rsi        # aa0 <_IO_stdin_used+0x20>
 9ba:	48 89 c7             	mov    %rax,%rdi
 9bd:	e8 6e fc ff ff       	callq  630 <strncmp@plt>
 9c2:	85 c0                	test   %eax,%eax
 9c4:	74 13                	je     9d9 <main+0x1cb>
 9c6:	48 8d 3d 38 01 00 00 	lea    0x138(%rip),%rdi        # b05 <_IO_stdin_used+0x85>
 9cd:	e8 6e fc ff ff       	callq  640 <puts@plt>
 9d2:	b8 01 00 00 00       	mov    $0x1,%eax
 9d7:	eb 11                	jmp    9ea <main+0x1dc>
 9d9:	48 8d 3d 38 01 00 00 	lea    0x138(%rip),%rdi        # b18 <_IO_stdin_used+0x98>
 9e0:	e8 5b fc ff ff       	callq  640 <puts@plt>
 9e5:	b8 00 00 00 00       	mov    $0x0,%eax
 9ea:	48 8b 4d f8          	mov    -0x8(%rbp),%rcx
 9ee:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
 9f5:	00 00 
 9f7:	74 05                	je     9fe <main+0x1f0>
 9f9:	e8 52 fc ff ff       	callq  650 <__stack_chk_fail@plt>
 9fe:	c9                   	leaveq 
 9ff:	c3                   	retq   

0000000000000a00 <__libc_csu_init>:
 a00:	41 57                	push   %r15
 a02:	41 56                	push   %r14
 a04:	49 89 d7             	mov    %rdx,%r15
 a07:	41 55                	push   %r13
 a09:	41 54                	push   %r12
 a0b:	4c 8d 25 86 03 20 00 	lea    0x200386(%rip),%r12        # 200d98 <__frame_dummy_init_array_entry>
 a12:	55                   	push   %rbp
 a13:	48 8d 2d 86 03 20 00 	lea    0x200386(%rip),%rbp        # 200da0 <__do_global_dtors_aux_fini_array_entry>
 a1a:	53                   	push   %rbx
 a1b:	41 89 fd             	mov    %edi,%r13d
 a1e:	49 89 f6             	mov    %rsi,%r14
 a21:	4c 29 e5             	sub    %r12,%rbp
 a24:	48 83 ec 08          	sub    $0x8,%rsp
 a28:	48 c1 fd 03          	sar    $0x3,%rbp
 a2c:	e8 c7 fb ff ff       	callq  5f8 <_init>
 a31:	48 85 ed             	test   %rbp,%rbp
 a34:	74 20                	je     a56 <__libc_csu_init+0x56>
 a36:	31 db                	xor    %ebx,%ebx
 a38:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
 a3f:	00 
 a40:	4c 89 fa             	mov    %r15,%rdx
 a43:	4c 89 f6             	mov    %r14,%rsi
 a46:	44 89 ef             	mov    %r13d,%edi
 a49:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
 a4d:	48 83 c3 01          	add    $0x1,%rbx
 a51:	48 39 dd             	cmp    %rbx,%rbp
 a54:	75 ea                	jne    a40 <__libc_csu_init+0x40>
 a56:	48 83 c4 08          	add    $0x8,%rsp
 a5a:	5b                   	pop    %rbx
 a5b:	5d                   	pop    %rbp
 a5c:	41 5c                	pop    %r12
 a5e:	41 5d                	pop    %r13
 a60:	41 5e                	pop    %r14
 a62:	41 5f                	pop    %r15
 a64:	c3                   	retq   
 a65:	90                   	nop
 a66:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
 a6d:	00 00 00 

0000000000000a70 <__libc_csu_fini>:
 a70:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000000a74 <_fini>:
 a74:	48 83 ec 08          	sub    $0x8,%rsp
 a78:	48 83 c4 08          	add    $0x8,%rsp
 a7c:	c3                   	retq   
