.class public Lcom/android/launcher3/allapps/AllAppsGridAdapter$a;
.super Landroidx/recyclerview/widget/GridLayoutManager$d;
.source "AllAppsGridAdapter.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/allapps/AllAppsGridAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation


# instance fields
.field final synthetic a:Lcom/android/launcher3/allapps/AllAppsGridAdapter;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/allapps/AllAppsGridAdapter;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter$a;->a:Lcom/android/launcher3/allapps/AllAppsGridAdapter;

    .line 2
    .line 3
    invoke-direct {p0}, Landroidx/recyclerview/widget/GridLayoutManager$d;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x1

    .line 7
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/GridLayoutManager$d;->setSpanIndexCacheEnabled(Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public getSpanSize(I)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter$a;->a:Lcom/android/launcher3/allapps/AllAppsGridAdapter;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/launcher3/allapps/AllAppsGridAdapter;->w(Lcom/android/launcher3/allapps/AllAppsGridAdapter;)Lcom/android/launcher3/allapps/AllAppsGridAdapter$AppsGridLayoutManager;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Landroidx/recyclerview/widget/GridLayoutManager;->B0()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget-object v1, p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter$a;->a:Lcom/android/launcher3/allapps/AllAppsGridAdapter;

    .line 12
    .line 13
    iget-object v1, v1, Lcom/android/launcher3/allapps/O;->c:Lcom/android/launcher3/allapps/M;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/android/launcher3/allapps/M;->h()Ljava/util/List;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-lt p1, v2, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    invoke-interface {v1, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lcom/android/launcher3/allapps/O$a;

    .line 31
    .line 32
    iget p1, p1, Lcom/android/launcher3/allapps/O$a;->a:I

    .line 33
    .line 34
    invoke-static {p1}, Lcom/android/launcher3/allapps/O;->k(I)Z

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    if-eqz v1, :cond_1

    .line 39
    .line 40
    iget-object p0, p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter$a;->a:Lcom/android/launcher3/allapps/AllAppsGridAdapter;

    .line 41
    .line 42
    iget p0, p0, Lcom/android/launcher3/allapps/O;->d:I

    .line 43
    .line 44
    div-int/2addr v0, p0

    .line 45
    return v0

    .line 46
    :cond_1
    iget-object v1, p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter$a;->a:Lcom/android/launcher3/allapps/AllAppsGridAdapter;

    .line 47
    .line 48
    iget-object v1, v1, Lcom/android/launcher3/allapps/O;->a:LP0/g;

    .line 49
    .line 50
    invoke-virtual {v1, p1}, LP0/g;->d(I)Z

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    if-eqz v1, :cond_2

    .line 55
    .line 56
    iget-object p0, p0, Lcom/android/launcher3/allapps/AllAppsGridAdapter$a;->a:Lcom/android/launcher3/allapps/AllAppsGridAdapter;

    .line 57
    .line 58
    iget-object v1, p0, Lcom/android/launcher3/allapps/O;->a:LP0/g;

    .line 59
    .line 60
    iget p0, p0, Lcom/android/launcher3/allapps/O;->d:I

    .line 61
    .line 62
    invoke-virtual {v1, p1, p0}, LP0/g;->b(II)I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    div-int/2addr v0, p0

    .line 67
    :cond_2
    :goto_0
    return v0
.end method
