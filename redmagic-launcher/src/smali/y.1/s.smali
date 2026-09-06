.class public final Ly/s;
.super Ly/z;
.source "ObjectAnimator.java"


# instance fields
.field private K:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private L:Ljava/lang/String;

.field private M:Landroid/util/Property;

.field private N:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ly/z;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ly/s;->N:Z

    return-void
.end method

.method private constructor <init>(Ljava/lang/Object;Landroid/util/Property;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Landroid/util/Property<",
            "TT;*>;)V"
        }
    .end annotation

    .line 3
    invoke-direct {p0}, Ly/z;-><init>()V

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Ly/s;->N:Z

    .line 5
    invoke-virtual {p0, p1}, Ly/s;->U(Ljava/lang/Object;)V

    .line 6
    invoke-virtual {p0, p2}, Ly/s;->T(Landroid/util/Property;)V

    return-void
.end method

.method private Q(Ly/d;)Z
    .locals 5

    .line 1
    instance-of v0, p1, Ly/s;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    check-cast p1, Ly/s;

    .line 7
    .line 8
    invoke-virtual {p1}, Ly/z;->x()[Ly/w;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {p1}, Ly/s;->P()Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p0}, Ly/s;->P()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    if-ne p1, v2, :cond_3

    .line 21
    .line 22
    iget-object p1, p0, Ly/z;->E:[Ly/w;

    .line 23
    .line 24
    array-length p1, p1

    .line 25
    array-length v2, v0

    .line 26
    if-ne p1, v2, :cond_3

    .line 27
    .line 28
    move p1, v1

    .line 29
    :goto_0
    iget-object v2, p0, Ly/z;->E:[Ly/w;

    .line 30
    .line 31
    array-length v3, v2

    .line 32
    if-ge p1, v3, :cond_2

    .line 33
    .line 34
    aget-object v2, v2, p1

    .line 35
    .line 36
    aget-object v3, v0, p1

    .line 37
    .line 38
    invoke-virtual {v2}, Ly/w;->i()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    if-eqz v4, :cond_1

    .line 43
    .line 44
    invoke-virtual {v2}, Ly/w;->i()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v3}, Ly/w;->i()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v3

    .line 52
    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-nez v2, :cond_0

    .line 57
    .line 58
    goto :goto_1

    .line 59
    :cond_0
    add-int/lit8 p1, p1, 0x1

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_1
    :goto_1
    return v1

    .line 63
    :cond_2
    const/4 p0, 0x1

    .line 64
    return p0

    .line 65
    :cond_3
    return v1
.end method

.method public static varargs R(Ljava/lang/Object;Landroid/util/Property;[F)Ly/s;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Landroid/util/Property<",
            "TT;",
            "Ljava/lang/Float;",
            ">;[F)",
            "Ly/s;"
        }
    .end annotation

    .line 1
    new-instance v0, Ly/s;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ly/s;-><init>(Ljava/lang/Object;Landroid/util/Property;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p2}, Ly/s;->H([F)V

    .line 7
    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public bridge synthetic G(J)Ly/z;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ly/s;->S(J)Ly/s;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public varargs H([F)V
    .locals 1

    .line 1
    iget-object v0, p0, Ly/z;->E:[Ly/w;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    array-length v0, v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-super {p0, p1}, Ly/z;->H([F)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_1
    :goto_0
    iget-object v0, p0, Ly/s;->M:Landroid/util/Property;

    .line 14
    .line 15
    if-eqz v0, :cond_2

    .line 16
    .line 17
    invoke-static {v0, p1}, Ly/w;->l(Landroid/util/Property;[F)Ly/w;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    filled-new-array {p1}, [Ly/w;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-virtual {p0, p1}, Ly/z;->J([Ly/w;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_2
    iget-object v0, p0, Ly/s;->L:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v0, p1}, Ly/w;->m(Ljava/lang/String;[F)Ly/w;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    filled-new-array {p1}, [Ly/w;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    invoke-virtual {p0, p1}, Ly/z;->J([Ly/w;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public L()V
    .locals 1

    .line 1
    invoke-static {}, Ly/c;->e()Ly/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p0}, Ly/c;->b(Ly/s;)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Ly/z;->L()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public O()Ly/s;
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NoClone"
        }
    .end annotation

    .line 1
    invoke-super {p0}, Ly/z;->q()Ly/z;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ly/s;

    .line 6
    .line 7
    return-object p0
.end method

.method public P()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ly/s;->K:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public S(J)Ly/s;
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Ly/z;->G(J)Ly/z;

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public T(Landroid/util/Property;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ly/z;->E:[Ly/w;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    aget-object v0, v0, v1

    .line 7
    .line 8
    invoke-virtual {v0}, Ly/w;->i()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {v0, p1}, Ly/w;->p(Landroid/util/Property;)V

    .line 13
    .line 14
    .line 15
    iget-object v3, p0, Ly/z;->F:Ljava/util/HashMap;

    .line 16
    .line 17
    invoke-virtual {v3, v2}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    iget-object v2, p0, Ly/z;->F:Ljava/util/HashMap;

    .line 21
    .line 22
    iget-object v3, p0, Ly/s;->L:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v2, v3, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    :cond_0
    iget-object v0, p0, Ly/s;->M:Landroid/util/Property;

    .line 28
    .line 29
    if-eqz v0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/util/Property;->getName()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Ly/s;->L:Ljava/lang/String;

    .line 36
    .line 37
    :cond_1
    iput-object p1, p0, Ly/s;->M:Landroid/util/Property;

    .line 38
    .line 39
    iput-boolean v1, p0, Ly/z;->v:Z

    .line 40
    .line 41
    return-void
.end method

.method public U(Ljava/lang/Object;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ly/s;->P()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-eq v0, p1, :cond_2

    .line 6
    .line 7
    invoke-virtual {p0}, Ly/z;->h()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ly/z;->cancel()V

    .line 14
    .line 15
    .line 16
    :cond_0
    if-nez p1, :cond_1

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    goto :goto_0

    .line 20
    :cond_1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 21
    .line 22
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    move-object p1, v0

    .line 26
    :goto_0
    iput-object p1, p0, Ly/s;->K:Ljava/lang/ref/WeakReference;

    .line 27
    .line 28
    const/4 p1, 0x0

    .line 29
    iput-boolean p1, p0, Ly/z;->v:Z

    .line 30
    .line 31
    :cond_2
    return-void
.end method

.method V(Ly/c$a;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Ly/s;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    check-cast p1, Ly/s;

    .line 10
    .line 11
    iget-boolean v1, p1, Ly/s;->N:Z

    .line 12
    .line 13
    if-eqz v1, :cond_1

    .line 14
    .line 15
    invoke-direct {p0, p1}, Ly/s;->Q(Ly/d;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const/4 p0, 0x1

    .line 22
    return p0

    .line 23
    :cond_1
    return v0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NoClone"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ly/s;->O()Ly/s;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic d()Ly/d;
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NoClone"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ly/s;->O()Ly/s;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method o(F)V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ly/s;->P()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ly/s;->K:Ljava/lang/ref/WeakReference;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ly/z;->cancel()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    invoke-super {p0, p1}, Ly/z;->o(F)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ly/z;->E:[Ly/w;

    .line 19
    .line 20
    array-length p1, p1

    .line 21
    const/4 v1, 0x0

    .line 22
    :goto_0
    if-ge v1, p1, :cond_1

    .line 23
    .line 24
    iget-object v2, p0, Ly/z;->E:[Ly/w;

    .line 25
    .line 26
    aget-object v2, v2, v1

    .line 27
    .line 28
    invoke-virtual {v2, v0}, Ly/w;->n(Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    add-int/lit8 v1, v1, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    return-void
.end method

.method public bridge synthetic q()Ly/z;
    .locals 0
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "NoClone"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ly/s;->O()Ly/s;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "ObjectAnimator@"

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v1, ", target "

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ly/s;->P()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v1, p0, Ly/z;->E:[Ly/w;

    .line 39
    .line 40
    if-eqz v1, :cond_0

    .line 41
    .line 42
    const/4 v1, 0x0

    .line 43
    :goto_0
    iget-object v2, p0, Ly/z;->E:[Ly/w;

    .line 44
    .line 45
    array-length v2, v2

    .line 46
    if-ge v1, v2, :cond_0

    .line 47
    .line 48
    new-instance v2, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v0, "\n    "

    .line 57
    .line 58
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ly/z;->E:[Ly/w;

    .line 62
    .line 63
    aget-object v0, v0, v1

    .line 64
    .line 65
    invoke-virtual {v0}, Ly/w;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    add-int/lit8 v1, v1, 0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_0
    return-object v0
.end method

.method y()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Ly/z;->v:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p0}, Ly/s;->P()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Ly/z;->E:[Ly/w;

    .line 12
    .line 13
    array-length v1, v1

    .line 14
    const/4 v2, 0x0

    .line 15
    :goto_0
    if-ge v2, v1, :cond_0

    .line 16
    .line 17
    iget-object v3, p0, Ly/z;->E:[Ly/w;

    .line 18
    .line 19
    aget-object v3, v3, v2

    .line 20
    .line 21
    invoke-virtual {v3, v0}, Ly/w;->s(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    add-int/lit8 v2, v2, 0x1

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    invoke-super {p0}, Ly/z;->y()V

    .line 28
    .line 29
    .line 30
    :cond_1
    return-void
.end method
