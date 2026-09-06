.class public LP0/b;
.super Ljava/lang/Object;
.source "AllAppsSearchUiDelegate.java"


# instance fields
.field protected final a:Lcom/android/launcher3/allapps/r;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/android/launcher3/allapps/r<",
            "*>;"
        }
    .end annotation
.end field

.field protected final b:Lcom/android/launcher3/views/k;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/allapps/r;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/launcher3/allapps/r<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LP0/b;->a:Lcom/android/launcher3/allapps/r;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-static {p1}, Lcom/android/launcher3/views/k;->m(Landroid/content/Context;)Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Lcom/android/launcher3/views/k;

    .line 15
    .line 16
    iput-object p1, p0, LP0/b;->b:Lcom/android/launcher3/views/k;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public a()LP0/g;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "LP0/g<",
            "*>;"
        }
    .end annotation

    .line 1
    new-instance v0, LP0/f;

    .line 2
    .line 3
    iget-object p0, p0, LP0/b;->b:Lcom/android/launcher3/views/k;

    .line 4
    .line 5
    invoke-direct {v0, p0}, LP0/f;-><init>(Lcom/android/launcher3/views/k;)V

    .line 6
    .line 7
    .line 8
    return-object v0
.end method

.method public b()Landroid/view/LayoutInflater;
    .locals 0

    .line 1
    iget-object p0, p0, LP0/b;->a:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public c()Landroid/view/View;
    .locals 3

    .line 1
    invoke-virtual {p0}, LP0/b;->b()Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, LP0/b;->a:Lcom/android/launcher3/allapps/r;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    const v2, 0x7f0e01da

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0, v2, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public d()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public e()V
    .locals 0

    .line 1
    return-void
.end method

.method public f()V
    .locals 0

    .line 1
    return-void
.end method

.method public g(Landroidx/recyclerview/widget/RecyclerView;)V
    .locals 0

    .line 1
    return-void
.end method

.method public h()V
    .locals 0

    .line 1
    return-void
.end method
