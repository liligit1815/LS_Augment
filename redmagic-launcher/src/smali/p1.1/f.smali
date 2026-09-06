.class public Lp1/f;
.super Ljava/lang/Object;
.source "HotseatUtils.java"


# direct methods
.method public static A(Lcom/android/launcher3/Hotseat;I)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "setHotseatCountXY childCount:"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    const-string v1, "HotseatUtils"

    .line 19
    .line 20
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 21
    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    if-nez p1, :cond_0

    .line 25
    .line 26
    move v1, v0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move v1, p1

    .line 29
    :goto_0
    invoke-static {}, Lx1/O;->C3()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-eqz v2, :cond_1

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    move p1, v1

    .line 37
    :goto_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    invoke-static {v1}, Lp1/f;->w(Landroid/content/Context;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_2

    .line 46
    .line 47
    invoke-virtual {p0, v0, p1}, Lcom/android/launcher3/CellLayout;->C0(II)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_2
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/CellLayout;->C0(II)V

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public static a(Lcom/android/launcher3/h0;)I
    .locals 5

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/r4;->o()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/high16 v0, 0x42700000    # 60.0f

    .line 8
    .line 9
    invoke-static {v0}, Lcom/android/launcher3/N5;->T(F)I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    const/high16 v1, 0x428a0000    # 69.0f

    .line 14
    .line 15
    invoke-static {v1}, Lcom/android/launcher3/N5;->T(F)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/high16 v2, 0x42980000    # 76.0f

    .line 20
    .line 21
    invoke-static {v2}, Lcom/android/launcher3/N5;->T(F)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    const/4 v3, 0x0

    .line 26
    cmpg-float v3, v3, p0

    .line 27
    .line 28
    const/high16 v4, 0x3f800000    # 1.0f

    .line 29
    .line 30
    if-gtz v3, :cond_0

    .line 31
    .line 32
    cmpg-float v3, p0, v4

    .line 33
    .line 34
    if-gez v3, :cond_0

    .line 35
    .line 36
    int-to-float v2, v0

    .line 37
    sub-int/2addr v1, v0

    .line 38
    int-to-float v0, v1

    .line 39
    mul-float/2addr v0, p0

    .line 40
    add-float/2addr v2, v0

    .line 41
    float-to-int p0, v2

    .line 42
    return p0

    .line 43
    :cond_0
    cmpg-float v0, v4, p0

    .line 44
    .line 45
    if-gtz v0, :cond_1

    .line 46
    .line 47
    const/high16 v0, 0x40000000    # 2.0f

    .line 48
    .line 49
    cmpg-float v0, p0, v0

    .line 50
    .line 51
    if-gtz v0, :cond_1

    .line 52
    .line 53
    int-to-float v0, v1

    .line 54
    sub-int/2addr v2, v1

    .line 55
    int-to-float v1, v2

    .line 56
    sub-float/2addr p0, v4

    .line 57
    mul-float/2addr v1, p0

    .line 58
    add-float/2addr v0, v1

    .line 59
    float-to-int p0, v0

    .line 60
    return p0

    .line 61
    :cond_1
    return v1
.end method

.method public static b(Lz1/y0;)Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lz1/y0;",
            ")",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x0

    .line 13
    :goto_0
    if-ge v2, v1, :cond_1

    .line 14
    .line 15
    iget-object v3, p0, Lz1/y0;->a:Lcom/android/launcher3/util/A0;

    .line 16
    .line 17
    invoke-virtual {v3, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    check-cast v3, Lcom/android/launcher3/model/data/y;

    .line 22
    .line 23
    invoke-static {v3}, Lp1/f;->u(Lcom/android/launcher3/model/data/y;)Z

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    if-eqz v4, :cond_0

    .line 28
    .line 29
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return-object v0
.end method

.method public static c(Lcom/android/launcher3/C2;I)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Lx1/O;->C3()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-static {p0}, Lp1/f;->h(Lcom/android/launcher3/C2;)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getMeasuredHeight()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingTop()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingBottom()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    add-int/2addr v1, v0

    .line 33
    sub-int/2addr p0, v1

    .line 34
    if-lez p1, :cond_1

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-static {p0, v0, p1}, Lcom/android/launcher3/h0;->P(III)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    :cond_1
    return p0
.end method

.method public static d(Lcom/android/launcher3/C2;I)I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {}, Lx1/O;->C3()Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-static {p0, p1}, Lp1/f;->k(Lcom/android/launcher3/C2;I)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0

    .line 20
    :cond_0
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getMeasuredWidth()I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingLeft()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getPaddingRight()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    add-int/2addr v1, v0

    .line 33
    sub-int/2addr p0, v1

    .line 34
    if-lez p1, :cond_1

    .line 35
    .line 36
    const/4 v0, 0x0

    .line 37
    invoke-static {p0, v0, p1}, Lcom/android/launcher3/h0;->P(III)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    :cond_1
    return p0
.end method

.method public static e(Ljava/util/List;)I
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/android/launcher3/model/data/y;",
            ">;)I"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Lcom/android/launcher3/model/data/y;

    .line 17
    .line 18
    iget v1, v1, Lcom/android/launcher3/model/data/y;->screenId:I

    .line 19
    .line 20
    if-le v1, v0, :cond_0

    .line 21
    .line 22
    move v0, v1

    .line 23
    goto :goto_0

    .line 24
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 25
    .line 26
    return v0
.end method

.method public static f(Lcom/android/launcher3/h0;)F
    .locals 3

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/h0;->C0:Lcom/android/launcher3/F1;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/android/launcher3/r4;->o()F

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    const/4 v0, 0x0

    .line 8
    cmpg-float v0, v0, p0

    .line 9
    .line 10
    const/high16 v1, 0x3f800000    # 1.0f

    .line 11
    .line 12
    if-gtz v0, :cond_0

    .line 13
    .line 14
    cmpg-float v0, p0, v1

    .line 15
    .line 16
    if-gez v0, :cond_0

    .line 17
    .line 18
    const v0, 0x3d23d700    # 0.03999996f

    .line 19
    .line 20
    .line 21
    mul-float/2addr p0, v0

    .line 22
    const v0, 0x3f3ae148    # 0.73f

    .line 23
    .line 24
    .line 25
    add-float/2addr p0, v0

    .line 26
    return p0

    .line 27
    :cond_0
    cmpg-float v0, v1, p0

    .line 28
    .line 29
    const v2, 0x3f451eb8    # 0.77f

    .line 30
    .line 31
    .line 32
    if-gtz v0, :cond_1

    .line 33
    .line 34
    const/high16 v0, 0x40000000    # 2.0f

    .line 35
    .line 36
    cmpg-float v0, p0, v0

    .line 37
    .line 38
    if-gtz v0, :cond_1

    .line 39
    .line 40
    const v0, 0x3da3d710    # 0.08000004f

    .line 41
    .line 42
    .line 43
    sub-float/2addr p0, v1

    .line 44
    mul-float/2addr p0, v0

    .line 45
    add-float/2addr p0, v2

    .line 46
    return p0

    .line 47
    :cond_1
    return v2
.end method

.method public static g(Landroid/content/Context;)I
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget p0, p0, Lcom/android/launcher3/F1;->e1:I

    .line 6
    .line 7
    return p0
.end method

.method public static h(Lcom/android/launcher3/C2;)I
    .locals 0

    .line 1
    invoke-static {p0}, Lp1/f;->m(Lcom/android/launcher3/C2;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static i(Lcom/android/launcher3/C2;I)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->O1()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p0, p1, v0}, Lp1/f;->j(Lcom/android/launcher3/C2;II)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static j(Lcom/android/launcher3/C2;II)I
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v1}, Lp1/f;->a(Lcom/android/launcher3/h0;)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/16 v0, 0xb

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const/4 v0, 0x7

    .line 24
    :goto_0
    add-int v2, p1, p2

    .line 25
    .line 26
    if-gt v2, v0, :cond_2

    .line 27
    .line 28
    :goto_1
    return v1

    .line 29
    :cond_2
    invoke-static {p0, p1, p2}, Lp1/f;->l(Lcom/android/launcher3/C2;II)I

    .line 30
    .line 31
    .line 32
    move-result p1

    .line 33
    int-to-float p1, p1

    .line 34
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p0}, Lp1/f;->f(Lcom/android/launcher3/h0;)F

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    mul-float/2addr p1, p0

    .line 43
    float-to-int p0, p1

    .line 44
    return p0
.end method

.method public static k(Lcom/android/launcher3/C2;I)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->O1()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p0, p1, v0}, Lp1/f;->l(Lcom/android/launcher3/C2;II)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static l(Lcom/android/launcher3/C2;II)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/high16 v0, 0x42ac0000    # 86.0f

    .line 6
    .line 7
    invoke-static {v0}, Lcom/android/launcher3/N5;->T(F)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-boolean p0, p0, Lcom/android/launcher3/h0;->N0:Z

    .line 12
    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    if-eqz p0, :cond_1

    .line 17
    .line 18
    const/16 p0, 0xb

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const/4 p0, 0x7

    .line 22
    :goto_0
    add-int/2addr p1, p2

    .line 23
    if-gt p1, p0, :cond_2

    .line 24
    .line 25
    :goto_1
    return v0

    .line 26
    :cond_2
    mul-int/2addr p0, v0

    .line 27
    const/high16 p2, 0x3f800000    # 1.0f

    .line 28
    .line 29
    int-to-float p0, p0

    .line 30
    mul-float/2addr p0, p2

    .line 31
    int-to-float p1, p1

    .line 32
    div-float/2addr p0, p1

    .line 33
    float-to-int p0, p0

    .line 34
    return p0
.end method

.method public static m(Lcom/android/launcher3/C2;)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const v0, 0x7f0c00ef

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getInteger(I)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    int-to-float p0, p0

    .line 13
    invoke-static {p0}, Lcom/android/launcher3/N5;->T(F)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public static n(Lcom/android/launcher3/C2;I)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->O1()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p0, p1, v0}, Lp1/f;->o(Lcom/android/launcher3/C2;II)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static o(Lcom/android/launcher3/C2;II)I
    .locals 1

    .line 1
    add-int v0, p1, p2

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Lp1/f;->l(Lcom/android/launcher3/C2;II)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    mul-int/2addr v0, p0

    .line 8
    return v0
.end method

.method public static p(Lcom/android/launcher3/C2;)I
    .locals 3

    .line 1
    invoke-static {}, Lx1/O;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_3

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    move v0, v1

    .line 20
    :goto_0
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    invoke-virtual {v2}, Landroid/view/ViewGroup;->getChildCount()I

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    if-ge v1, v2, :cond_2

    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-nez v2, :cond_1

    .line 43
    .line 44
    add-int/lit8 v0, v0, 0x1

    .line 45
    .line 46
    :cond_1
    add-int/lit8 v1, v1, 0x1

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :cond_2
    return v0

    .line 50
    :cond_3
    return v1
.end method

.method public static q(Lcom/android/launcher3/C2;I)I
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->O1()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p0, p1, v0}, Lp1/f;->r(Lcom/android/launcher3/C2;II)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static r(Lcom/android/launcher3/C2;II)I
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/v;->getDeviceProfile()Lcom/android/launcher3/h0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    iget-boolean v1, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    const v1, 0x7f0c00f1

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const v1, 0x7f0c00f0

    .line 18
    .line 19
    .line 20
    :goto_0
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getInteger(I)I

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    int-to-float p0, p0

    .line 25
    invoke-static {p0}, Lcom/android/launcher3/N5;->T(F)I

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    const/high16 v1, 0x42ac0000    # 86.0f

    .line 30
    .line 31
    invoke-static {v1}, Lcom/android/launcher3/N5;->T(F)I

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    iget-boolean v0, v0, Lcom/android/launcher3/h0;->N0:Z

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    const/16 v0, 0xb

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :cond_1
    const/4 v0, 0x7

    .line 43
    :goto_1
    mul-int/lit8 p0, p0, 0x2

    .line 44
    .line 45
    const/4 v2, 0x4

    .line 46
    mul-int v3, v2, v1

    .line 47
    .line 48
    add-int/2addr v3, p0

    .line 49
    mul-int v4, v0, v1

    .line 50
    .line 51
    add-int/2addr v4, p0

    .line 52
    add-int/2addr p1, p2

    .line 53
    if-gt p1, v2, :cond_2

    .line 54
    .line 55
    return v3

    .line 56
    :cond_2
    if-le p1, v0, :cond_3

    .line 57
    .line 58
    goto :goto_2

    .line 59
    :cond_3
    mul-int/2addr p1, v1

    .line 60
    add-int/2addr p0, p1

    .line 61
    if-le p0, v4, :cond_4

    .line 62
    .line 63
    :goto_2
    return v4

    .line 64
    :cond_4
    return p0
.end method

.method public static s(Lcom/android/launcher3/C2;)I
    .locals 6

    .line 1
    invoke-static {}, Lx1/O;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    if-eqz v0, :cond_8

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const v0, 0x7f0b04be

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const v2, 0x7f0b04c1

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0, v2}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    const v3, 0x7f0b04c2

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    const v4, 0x7f0b04c0

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v4}, Landroid/view/ViewGroup;->getTag(I)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    instance-of v5, v2, Ljava/lang/Boolean;

    .line 48
    .line 49
    if-eqz v5, :cond_5

    .line 50
    .line 51
    check-cast v2, Ljava/lang/Boolean;

    .line 52
    .line 53
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    instance-of v2, v3, Ljava/lang/Boolean;

    .line 58
    .line 59
    if-eqz v2, :cond_1

    .line 60
    .line 61
    check-cast v3, Ljava/lang/Boolean;

    .line 62
    .line 63
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    goto :goto_0

    .line 68
    :cond_1
    move v2, v1

    .line 69
    :goto_0
    move v3, v1

    .line 70
    :goto_1
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 71
    .line 72
    .line 73
    move-result-object v4

    .line 74
    invoke-virtual {v4}, Landroid/view/ViewGroup;->getChildCount()I

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    if-ge v1, v4, :cond_4

    .line 79
    .line 80
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getShortcutsAndWidgets()Lcom/android/launcher3/K5;

    .line 81
    .line 82
    .line 83
    move-result-object v4

    .line 84
    invoke-virtual {v4, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    invoke-virtual {v4}, Landroid/view/View;->getVisibility()I

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    if-eqz v4, :cond_2

    .line 93
    .line 94
    if-eqz v0, :cond_3

    .line 95
    .line 96
    if-nez v2, :cond_3

    .line 97
    .line 98
    :cond_2
    add-int/lit8 v3, v3, 0x1

    .line 99
    .line 100
    :cond_3
    add-int/lit8 v1, v1, 0x1

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_4
    return v3

    .line 104
    :cond_5
    instance-of v1, v0, Ljava/lang/Integer;

    .line 105
    .line 106
    if-eqz v1, :cond_6

    .line 107
    .line 108
    check-cast v0, Ljava/lang/Integer;

    .line 109
    .line 110
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    return p0

    .line 115
    :cond_6
    instance-of v0, v4, Ljava/lang/Integer;

    .line 116
    .line 117
    if-eqz v0, :cond_7

    .line 118
    .line 119
    check-cast v4, Ljava/lang/Integer;

    .line 120
    .line 121
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    return p0

    .line 126
    :cond_7
    invoke-virtual {p0}, Lcom/android/launcher3/CellLayout;->getCountX()I

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    return p0

    .line 131
    :cond_8
    return v1
.end method

.method public static t(Landroid/view/View;)Z
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    instance-of v0, v0, Lcom/android/launcher3/model/data/y;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getTag()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/android/launcher3/model/data/y;

    .line 22
    .line 23
    invoke-static {p0}, Lp1/f;->u(Lcom/android/launcher3/model/data/y;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    return p0

    .line 28
    :cond_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method

.method public static u(Lcom/android/launcher3/model/data/y;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_0

    .line 3
    .line 4
    iget p0, p0, Lcom/android/launcher3/model/data/y;->container:I

    .line 5
    .line 6
    const/16 v1, -0x65

    .line 7
    .line 8
    if-ne p0, v1, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0

    .line 12
    :cond_0
    return v0
.end method

.method public static v(Lcom/android/launcher3/C2;Landroid/view/View;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/C2;->X1()Lcom/android/launcher3/Hotseat;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    instance-of v0, p1, Lcom/android/launcher3/CellLayout;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    if-ne p1, p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public static w(Landroid/content/Context;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/android/launcher3/P2;->e(Landroid/content/Context;)Lcom/android/launcher3/F1;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Lcom/android/launcher3/F1;->t0(Landroid/content/Context;)Lcom/android/launcher3/h0;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lcom/android/launcher3/h0;->T0()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static x(Landroid/view/View;)Z
    .locals 3

    .line 1
    invoke-static {}, Lx1/O;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    if-nez p0, :cond_1

    .line 10
    .line 11
    return v1

    .line 12
    :cond_1
    invoke-static {p0}, Lp1/f;->y(Landroid/view/View;)Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/4 v2, 0x1

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    return v2

    .line 20
    :cond_2
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    instance-of v0, v0, Lcom/android/launcher3/K5;

    .line 25
    .line 26
    if-eqz v0, :cond_3

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-interface {p0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    instance-of p0, p0, Lcom/android/launcher3/Hotseat;

    .line 37
    .line 38
    if-eqz p0, :cond_3

    .line 39
    .line 40
    return v2

    .line 41
    :cond_3
    return v1
.end method

.method public static y(Landroid/view/View;)Z
    .locals 2

    .line 1
    invoke-static {}, Lx1/O;->C3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    if-nez p0, :cond_1

    .line 10
    .line 11
    return v1

    .line 12
    :cond_1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    instance-of v0, v0, Lcom/android/launcher3/K5;

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p0}, Landroid/view/ViewParent;->getParent()Landroid/view/ViewParent;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    instance-of p0, p0, Lcom/android/launcher3/hotseat/HotseatRecentCellLayout;

    .line 29
    .line 30
    if-eqz p0, :cond_2

    .line 31
    .line 32
    const/4 p0, 0x1

    .line 33
    return p0

    .line 34
    :cond_2
    return v1
.end method

.method public static z(Lcom/android/launcher3/model/data/y;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_2

    .line 3
    .line 4
    iget p0, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 5
    .line 6
    const/4 v1, 0x4

    .line 7
    if-eq p0, v1, :cond_1

    .line 8
    .line 9
    const/4 v1, 0x5

    .line 10
    if-ne p0, v1, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    return v0

    .line 14
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_2
    return v0
.end method
