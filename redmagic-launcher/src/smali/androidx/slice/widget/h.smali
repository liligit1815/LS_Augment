.class public abstract Landroidx/slice/widget/h;
.super Landroid/widget/FrameLayout;
.source "SliceChildView.java"


# instance fields
.field protected g:I

.field protected h:Z

.field protected i:J

.field protected j:I

.field protected k:I

.field protected l:I

.field protected m:I

.field protected n:Landroidx/slice/widget/g;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const/4 p1, -0x1

    .line 2
    iput p1, p0, Landroidx/slice/widget/h;->g:I

    const-wide/16 v0, -0x1

    .line 3
    iput-wide v0, p0, Landroidx/slice/widget/h;->i:J

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 4
    invoke-direct {p0, p1}, Landroidx/slice/widget/h;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public abstract a()V
.end method

.method public b(IIII)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/slice/widget/h;->j:I

    .line 2
    .line 3
    iput p2, p0, Landroidx/slice/widget/h;->k:I

    .line 4
    .line 5
    iput p3, p0, Landroidx/slice/widget/h;->l:I

    .line 6
    .line 7
    iput p4, p0, Landroidx/slice/widget/h;->m:I

    .line 8
    .line 9
    return-void
.end method

.method public getLoadingActions()Ljava/util/Set;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Landroidx/slice/SliceItem;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public getMode()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method

.method public setActionLoading(Landroidx/slice/SliceItem;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setAllowTwoLines(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public setLastUpdated(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Landroidx/slice/widget/h;->i:J

    .line 2
    .line 3
    return-void
.end method

.method public setLoadingActions(Ljava/util/Set;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Landroidx/slice/SliceItem;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public setPolicy(Landroidx/slice/widget/n;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setShowLastUpdated(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Landroidx/slice/widget/h;->h:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSliceActionListener(Landroidx/slice/widget/m$b;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setSliceActionLoadingListener(Landroidx/slice/widget/g;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/slice/widget/h;->n:Landroidx/slice/widget/g;

    .line 2
    .line 3
    return-void
.end method

.method public setSliceActions(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lh0/d;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public setSliceContent(Landroidx/slice/widget/d;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setStyle(Landroidx/slice/widget/l;)V
    .locals 0

    .line 1
    return-void
.end method

.method public setTint(I)V
    .locals 0

    .line 1
    iput p1, p0, Landroidx/slice/widget/h;->g:I

    .line 2
    .line 3
    return-void
.end method
