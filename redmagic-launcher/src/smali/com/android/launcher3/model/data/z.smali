.class public abstract Lcom/android/launcher3/model/data/z;
.super Lcom/android/launcher3/model/data/y;
.source "ItemInfoWithIcon.java"


# instance fields
.field public g:Ls1/d;

.field public h:I

.field private i:I

.field private j:Z


# direct methods
.method protected constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/android/launcher3/model/data/y;-><init>()V

    .line 2
    sget-object v0, Ls1/d;->i:Ls1/d;

    iput-object v0, p0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    const/4 v0, 0x0

    .line 3
    iput v0, p0, Lcom/android/launcher3/model/data/z;->h:I

    const/16 v0, 0x64

    .line 4
    iput v0, p0, Lcom/android/launcher3/model/data/z;->i:I

    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/android/launcher3/model/data/z;->j:Z

    return-void
.end method

.method protected constructor <init>(Lcom/android/launcher3/model/data/z;)V
    .locals 1

    .line 6
    invoke-direct {p0, p1}, Lcom/android/launcher3/model/data/y;-><init>(Lcom/android/launcher3/model/data/y;)V

    .line 7
    sget-object v0, Ls1/d;->i:Ls1/d;

    iput-object v0, p0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/android/launcher3/model/data/z;->h:I

    const/16 v0, 0x64

    .line 9
    iput v0, p0, Lcom/android/launcher3/model/data/z;->i:I

    const/4 v0, 0x1

    .line 10
    iput-boolean v0, p0, Lcom/android/launcher3/model/data/z;->j:Z

    .line 11
    iget-object v0, p1, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    iput-object v0, p0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 12
    iget v0, p1, Lcom/android/launcher3/model/data/z;->i:I

    iput v0, p0, Lcom/android/launcher3/model/data/z;->i:I

    .line 13
    iget v0, p1, Lcom/android/launcher3/model/data/z;->h:I

    iput v0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 14
    iget-object p1, p1, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    iput-object p1, p0, Lcom/android/launcher3/model/data/y;->user:Landroid/os/UserHandle;

    return-void
.end method


# virtual methods
.method public A()Z
    .locals 2

    .line 1
    invoke-static {}, Lcom/android/launcher3/y0;->b0()Z

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
    iget p0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 10
    .line 11
    and-int/lit16 p0, p0, 0x4000

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_1
    return v1
.end method

.method public B()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/z;->A()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 8
    .line 9
    and-int/lit16 p0, p0, 0x400

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public C()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/android/launcher3/model/data/z;->j:Z

    .line 2
    .line 3
    return p0
.end method

.method public D()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 2
    .line 3
    const v0, 0x8000

    .line 4
    .line 5
    .line 6
    and-int/2addr p0, v0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public E()Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/z;->y()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public F(Landroid/content/Context;)Ls1/o;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, p1, v0}, Lcom/android/launcher3/model/data/z;->G(Landroid/content/Context;I)Ls1/o;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public G(Landroid/content/Context;I)Ls1/o;
    .locals 2

    .line 1
    sget-object v0, Ln1/C;->g:Lcom/android/launcher3/util/I;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Ln1/C;

    .line 8
    .line 9
    invoke-virtual {v0}, Ln1/C;->m()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    and-int/lit8 p2, p2, -0x2

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/android/launcher3/N5;->p(Landroid/content/Context;)Landroid/graphics/Path;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, p1, p2, v1}, Ls1/d;->o(Landroid/content/Context;ILandroid/graphics/Path;)Ls1/o;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/z;->isDisabled()Z

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    if-eqz p2, :cond_1

    .line 32
    .line 33
    iget p2, p0, Lcom/android/launcher3/model/data/y;->itemType:I

    .line 34
    .line 35
    const/4 v0, 0x6

    .line 36
    if-ne p2, v0, :cond_1

    .line 37
    .line 38
    iget p2, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 39
    .line 40
    and-int/lit8 p2, p2, 0x20

    .line 41
    .line 42
    if-eqz p2, :cond_1

    .line 43
    .line 44
    const/4 p0, 0x0

    .line 45
    invoke-virtual {p1, p0}, Ls1/o;->s(Z)V

    .line 46
    .line 47
    .line 48
    return-object p1

    .line 49
    :cond_1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/z;->isDisabled()Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    invoke-virtual {p1, p0}, Ls1/o;->s(Z)V

    .line 54
    .line 55
    .line 56
    return-object p1
.end method

.method public H(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/android/launcher3/model/data/z;->j:Z

    .line 2
    .line 3
    return-void
.end method

.method public I(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget p1, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 4
    .line 5
    const v0, 0x8000

    .line 6
    .line 7
    .line 8
    or-int/2addr p1, v0

    .line 9
    iput p1, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget p1, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 13
    .line 14
    const v0, -0x8001

    .line 15
    .line 16
    .line 17
    and-int/2addr p1, v0

    .line 18
    iput p1, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 19
    .line 20
    return-void
.end method

.method public J(II)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    const/16 v1, 0x64

    .line 3
    .line 4
    if-ne p2, v0, :cond_1

    .line 5
    .line 6
    iput p1, p0, Lcom/android/launcher3/model/data/z;->i:I

    .line 7
    .line 8
    if-ge p1, v1, :cond_0

    .line 9
    .line 10
    iget p1, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 11
    .line 12
    or-int/lit16 p1, p1, 0x400

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iget p1, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 16
    .line 17
    and-int/lit16 p1, p1, -0x401

    .line 18
    .line 19
    :goto_0
    iput p1, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    const/4 v0, 0x2

    .line 23
    if-ne p2, v0, :cond_3

    .line 24
    .line 25
    iput p1, p0, Lcom/android/launcher3/model/data/z;->i:I

    .line 26
    .line 27
    iget p2, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 28
    .line 29
    and-int/lit16 v0, p2, -0x401

    .line 30
    .line 31
    iput v0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 32
    .line 33
    if-ge p1, v1, :cond_2

    .line 34
    .line 35
    or-int/lit16 p1, v0, 0x800

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_2
    and-int/lit16 p1, p2, -0xc01

    .line 39
    .line 40
    :goto_1
    iput p1, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 41
    .line 42
    return-void

    .line 43
    :cond_3
    if-nez p2, :cond_4

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_4
    const/4 v1, 0x0

    .line 47
    :goto_2
    iput v1, p0, Lcom/android/launcher3/model/data/z;->i:I

    .line 48
    .line 49
    iget p1, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 50
    .line 51
    and-int/lit16 p1, p1, -0xc01

    .line 52
    .line 53
    iput p1, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 54
    .line 55
    return-void
.end method

.method public K(LD1/f;)V
    .locals 2

    .line 1
    iget v0, p1, LD1/f;->d:I

    .line 2
    .line 3
    iget v1, p1, LD1/f;->c:I

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Lcom/android/launcher3/model/data/z;->J(II)V

    .line 6
    .line 7
    .line 8
    iget v0, p1, LD1/f;->c:I

    .line 9
    .line 10
    const/4 v1, 0x3

    .line 11
    if-ne v0, v1, :cond_0

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v1, "Icon info: "

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p0, " marked broken with install info: "

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    new-instance p1, Ljava/lang/Exception;

    .line 39
    .line 40
    invoke-direct {p1}, Ljava/lang/Exception;-><init>()V

    .line 41
    .line 42
    .line 43
    const-string v0, "ItemInfoDebug"

    .line 44
    .line 45
    invoke-static {v0, p0, p1}, Lcom/android/launcher3/logging/b;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Exception;)V

    .line 46
    .line 47
    .line 48
    :cond_0
    return-void
.end method

.method protected L(Z)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget p1, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 4
    .line 5
    const/high16 v0, 0x10000

    .line 6
    .line 7
    or-int/2addr p1, v0

    .line 8
    iput p1, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    iget p1, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 12
    .line 13
    const v0, -0x10001

    .line 14
    .line 15
    .line 16
    and-int/2addr p1, v0

    .line 17
    iput p1, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 18
    .line 19
    return-void
.end method

.method public M()Z
    .locals 1

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 2
    .line 3
    const/high16 v0, 0x10000

    .line 4
    .line 5
    and-int/2addr p0, v0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x1

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public bridge synthetic clone()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/z;->v()Lcom/android/launcher3/model/data/z;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method protected dumpProperties()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-super {p0}, Lcom/android/launcher3/model/data/y;->dumpProperties()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " supportsMultiInstance="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/z;->M()Z

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v1, " nonResizeable="

    .line 26
    .line 27
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/z;->D()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public isDisabled()Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 2
    .line 3
    and-int/lit16 p0, p0, 0x103f

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    return p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return p0
.end method

.method public abstract v()Lcom/android/launcher3/model/data/z;
.end method

.method public w(Landroid/content/Context;)Landroid/content/Intent;
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/y;->getTargetPackage()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/android/launcher3/util/f;->c:Lcom/android/launcher3/util/I;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Lcom/android/launcher3/util/I;->a(Landroid/content/Context;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    check-cast p1, Lcom/android/launcher3/util/f;

    .line 14
    .line 15
    invoke-static {}, Landroid/os/Process;->myUserHandle()Landroid/os/UserHandle;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p1, p0, v0}, Lcom/android/launcher3/util/f;->d(Ljava/lang/String;Landroid/os/UserHandle;)Landroid/content/Intent;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0

    .line 24
    :cond_0
    const/4 p0, 0x0

    .line 25
    return-object p0
.end method

.method public x()Lt1/g;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/model/data/z;->g:Ls1/d;

    .line 2
    .line 3
    invoke-virtual {p0}, Ls1/d;->h()Lt1/g;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public y()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 2
    .line 3
    and-int/lit16 v0, v0, 0xc00

    .line 4
    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/z;->A()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    const/16 p0, 0x64

    .line 15
    .line 16
    return p0

    .line 17
    :cond_1
    :goto_0
    iget p0, p0, Lcom/android/launcher3/model/data/z;->i:I

    .line 18
    .line 19
    return p0
.end method

.method public z()Z
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/launcher3/model/data/z;->h:I

    .line 2
    .line 3
    and-int/lit16 v1, v0, 0x400

    .line 4
    .line 5
    if-nez v1, :cond_1

    .line 6
    .line 7
    and-int/lit16 v0, v0, 0x800

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget v0, p0, Lcom/android/launcher3/model/data/z;->i:I

    .line 12
    .line 13
    const/16 v1, 0x64

    .line 14
    .line 15
    if-eq v0, v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Lcom/android/launcher3/model/data/z;->A()Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-eqz p0, :cond_1

    .line 22
    .line 23
    :cond_0
    const/4 p0, 0x1

    .line 24
    return p0

    .line 25
    :cond_1
    const/4 p0, 0x0

    .line 26
    return p0
.end method
