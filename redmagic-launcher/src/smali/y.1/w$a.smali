.class Ly/w$a;
.super Ly/w;
.source "PropertyValuesHolder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ly/w;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "a"
.end annotation


# instance fields
.field private v:Ly/l;

.field w:Ly/q$a;

.field x:F


# direct methods
.method varargs constructor <init>(Landroid/util/Property;[F)V
    .locals 0

    .line 3
    invoke-direct {p0, p1}, Ly/w;-><init>(Landroid/util/Property;)V

    .line 4
    invoke-virtual {p0, p2}, Ly/w$a;->o([F)V

    .line 5
    instance-of p1, p1, Ly/l;

    if-eqz p1, :cond_0

    .line 6
    iget-object p1, p0, Ly/w;->h:Landroid/util/Property;

    check-cast p1, Ly/l;

    iput-object p1, p0, Ly/w$a;->v:Ly/l;

    :cond_0
    return-void
.end method

.method varargs constructor <init>(Ljava/lang/String;[F)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ly/w;-><init>(Ljava/lang/String;)V

    .line 2
    invoke-virtual {p0, p2}, Ly/w$a;->o([F)V

    return-void
.end method


# virtual methods
.method a(F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ly/w$a;->w:Ly/q$a;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ly/q$a;->g(F)F

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    iput p1, p0, Ly/w$a;->x:F

    .line 8
    .line 9
    return-void
.end method

.method public bridge synthetic b()Ly/w;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ly/w$a;->u()Ly/w$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ly/w$a;->u()Ly/w$a;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method d()Ljava/lang/Object;
    .locals 0

    .line 1
    iget p0, p0, Ly/w$a;->x:F

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method n(Ljava/lang/Object;)V
    .locals 4

    .line 1
    const-string v0, "PropertyValuesHolder"

    .line 2
    .line 3
    iget-object v1, p0, Ly/w$a;->v:Ly/l;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget p0, p0, Ly/w$a;->x:F

    .line 8
    .line 9
    invoke-virtual {v1, p1, p0}, Ly/l;->b(Ljava/lang/Object;F)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v1, p0, Ly/w;->h:Landroid/util/Property;

    .line 14
    .line 15
    if-eqz v1, :cond_1

    .line 16
    .line 17
    iget p0, p0, Ly/w$a;->x:F

    .line 18
    .line 19
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {v1, p1, p0}, Landroid/util/Property;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    iget-object v1, p0, Ly/w;->i:Ljava/lang/reflect/Method;

    .line 28
    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    :try_start_0
    iget-object v1, p0, Ly/w;->m:[Ljava/lang/Object;

    .line 32
    .line 33
    iget v2, p0, Ly/w$a;->x:F

    .line 34
    .line 35
    invoke-static {v2}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    const/4 v3, 0x0

    .line 40
    aput-object v2, v1, v3

    .line 41
    .line 42
    iget-object v1, p0, Ly/w;->i:Ljava/lang/reflect/Method;

    .line 43
    .line 44
    iget-object p0, p0, Ly/w;->m:[Ljava/lang/Object;

    .line 45
    .line 46
    invoke-virtual {v1, p1, p0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :catch_0
    move-exception p0

    .line 51
    goto :goto_0

    .line 52
    :catch_1
    move-exception p0

    .line 53
    goto :goto_1

    .line 54
    :goto_0
    invoke-virtual {p0}, Ljava/lang/IllegalAccessException;->toString()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 59
    .line 60
    .line 61
    goto :goto_2

    .line 62
    :goto_1
    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->toString()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 67
    .line 68
    .line 69
    :cond_2
    :goto_2
    return-void
.end method

.method public varargs o([F)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Ly/w;->o([F)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ly/w;->l:Ly/q;

    .line 5
    .line 6
    check-cast p1, Ly/q$a;

    .line 7
    .line 8
    iput-object p1, p0, Ly/w$a;->w:Ly/q$a;

    .line 9
    .line 10
    return-void
.end method

.method public p(Landroid/util/Property;)V
    .locals 1

    .line 1
    instance-of v0, p1, Ly/l;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Ly/l;

    .line 6
    .line 7
    iput-object p1, p0, Ly/w$a;->v:Ly/l;

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-super {p0, p1}, Ly/w;->p(Landroid/util/Property;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public u()Ly/w$a;
    .locals 1

    .line 1
    invoke-super {p0}, Ly/w;->b()Ly/w;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ly/w$a;

    .line 6
    .line 7
    iget-object v0, p0, Ly/w;->l:Ly/q;

    .line 8
    .line 9
    check-cast v0, Ly/q$a;

    .line 10
    .line 11
    iput-object v0, p0, Ly/w$a;->w:Ly/q$a;

    .line 12
    .line 13
    return-object p0
.end method
