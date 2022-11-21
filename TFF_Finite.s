%------------------------------------------------------------------------------
tff(man_type,type,           man: $tType ).
tff(grade_type,type,         grade: $tType ).
tff(john_decl,type,          john: man ).
tff(a_decl,type,             a: grade ).
tff(f_decl,type,             f: grade ).
tff(grade_of_decl,type,      grade_of: man > grade ).
tff(created_equal_decl,type, created_equal: ( man * man ) > $o ).

tff(d_man_type,type,         d_man: $tType).
tff(d_grade_type,type,       d_grade: $tType).
tff(d_to_man_decl,type,      d_to_man: d_man > man ).
tff(d_to_grade_decl,type,    d_to_grade: d_grade > grade ).

tff(d_john_decl,type,        d_john: d_man ).
tff(d_got_A_decl,type,       d_got_A: d_man ).
tff(d_a_decl,type,           d_a: d_grade ).
tff(d_f_decl,type,           d_f: d_grade ).

tff(equality_lost,interpretation,
%----The domain for man is d_man
    ( ( ! [M: man] : ? [DM: d_man] : M = d2man(DM)
%----The d_man elements are d_john and d_got_A
      & ! [DM: d_man] : ( DM = d_john | DM = d_got_A )
      & $distinct(d_john,d_got_A)
%----The type promoter is a bijection 
      & ! [DM1: d_man,DM2: d_man] :
          ( d2man(DM1) = d2man(DM2) => DM1 = DM2 )
%----The domain for grade is d_grade
      & ! [G: grade] : ? [DG: d_grade] : G = d2grade(DG)
%----The d_grade elements are d_a and d_f
      & ! [DG: d_grade]: ( DG = d_a | DG = d_f )
      & $distinct(d_a,d_f)
%----The type promoter is a bijection
      & ! [DG1: d_grade,DG2: d_grade] : 
          ( d2grade(DG1) = d2grade(DG2) => DG1 = DG2 ) )
%----Interpret terms via the type-promoted domain
    & ( a = d2grade(d_a)
      & f = d2grade(d_f)
      & john = d2man(d_john)
      & grade_of(d2man(d_john)) = d2grade(d_f)
      & grade_of(d2man(d_got_A)) = d2grade(d_a) )
%----Interpret atoms as true or false
    & ( created_equal(d2man(d_john),d2man(d_john))
      & created_equal(d2man(d_john),d2man(d_got_A))
      & created_equal(d2man(d_got_A),d2man(d_john))
      & created_equal(d2man(d_got_A),d2man(d_got_A)) ) ) ).
%----If John was not equal to the man who got an A:
%---- & ~ created_equal(d2man(d_john),d2man(d_got_A))
%---- & ~ created_equal(d2man(d_got_A),d2man(d_john))
%------------------------------------------------------------------------------
