{-

Combinators:

1. yes
2. no
3. yes
4. yes
5. no

Normal or Diverge:

1. normal form
2. diverge
3. normal form

Beta Reduce:

1. (\abc.cba)zz(\wv.w)
   (\c.czz)(\wv.w)
   (\wv.w)zz
   z

2. (\x.(\y.xyy))(\a.a)b
   (\y.(\a.a)yy)b
   (\a.a)bb
   bb

3. (\y.y)(\x.xx)(\z.zq)
   (\x.xx)(\z.zq)
   (\z.zq)(\z.zq)
   (\z.zq)q
   qq

4. (\z.z)(\z.zz)(\z.zy)
   === (\y.y)(\x.xx)(\z.zq)
   yy

5. (\x.(\y.xyy))(\y.y)y
   (\y.(\y.y)yy)y
   (\y.y)yy
   yy

6. (\a.aa)(\b.ba)c
   (\b.ba)(\b.ba)c
   ((\b.ba)a)c
   aac

7. (\xyz.xz(yz))(\x.z)(\x.a)
   (\yz.(\x.z)z(yz))(\x.a)
   (\z.(\x.z)z((\x.a)z))
   (\z.z((\x.a)z))
   (\z.za)


-}
