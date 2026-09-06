.class public Lk1/b;
.super Lk1/a;
.source "FolderDotInfo.java"


# instance fields
.field private d:I


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lk1/a;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public d()I
    .locals 0

    .line 1
    iget p0, p0, Lk1/b;->d:I

    .line 2
    .line 3
    return p0
.end method

.method public i(Landroid/content/Context;Lk1/a;)V
    .locals 1

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Lcom/android/launcher3/P2;->h(Landroid/content/Context;)Lcom/android/launcher3/P2;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    invoke-virtual {p1}, Lcom/android/launcher3/P2;->k()Lcom/android/launcher3/H5;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-virtual {p1}, Lcom/android/launcher3/H5;->B()Lcom/android/launcher3/H5$c;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    sget-object v0, Lcom/android/launcher3/H5$c;->g:Lcom/android/launcher3/H5$c;

    .line 21
    .line 22
    if-ne p1, v0, :cond_1

    .line 23
    .line 24
    iget p1, p0, Lk1/b;->d:I

    .line 25
    .line 26
    invoke-virtual {p2}, Lk1/a;->d()I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    add-int/2addr p1, p2

    .line 31
    iput p1, p0, Lk1/b;->d:I

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    iget p1, p0, Lk1/b;->d:I

    .line 35
    .line 36
    invoke-virtual {p2}, Lk1/a;->e()Ljava/util/List;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-interface {p2}, Ljava/util/List;->size()I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    add-int/2addr p1, p2

    .line 45
    iput p1, p0, Lk1/b;->d:I

    .line 46
    .line 47
    :goto_0
    iget p1, p0, Lk1/b;->d:I

    .line 48
    .line 49
    const/4 p2, 0x0

    .line 50
    const/16 v0, 0x3e8

    .line 51
    .line 52
    invoke-static {p1, p2, v0}, Lcom/android/launcher3/N5;->c(III)I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    iput p1, p0, Lk1/b;->d:I

    .line 57
    .line 58
    return-void
.end method

.method public j()Z
    .locals 0
    .annotation runtime Landroid/view/ViewDebug$ExportedProperty;
        category = "launcher"
    .end annotation

    .line 1
    iget p0, p0, Lk1/b;->d:I

    .line 2
    .line 3
    if-lez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public k()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lk1/b;->d:I

    .line 3
    .line 4
    return-void
.end method
