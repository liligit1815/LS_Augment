.class Landroidx/slice/widget/GridRowView$a;
.super Ljava/lang/Object;
.source "GridRowView.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnPreDrawListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/slice/widget/GridRowView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroidx/slice/widget/GridRowView;


# direct methods
.method constructor <init>(Landroidx/slice/widget/GridRowView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Landroidx/slice/widget/GridRowView$a;->g:Landroidx/slice/widget/GridRowView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onPreDraw()Z
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/slice/widget/GridRowView$a;->g:Landroidx/slice/widget/GridRowView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroidx/slice/widget/GridRowView;->getMaxCells()I

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    iput v1, v0, Landroidx/slice/widget/GridRowView;->z:I

    .line 8
    .line 9
    iget-object v0, p0, Landroidx/slice/widget/GridRowView$a;->g:Landroidx/slice/widget/GridRowView;

    .line 10
    .line 11
    invoke-virtual {v0}, Landroidx/slice/widget/GridRowView;->j()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Landroidx/slice/widget/GridRowView$a;->g:Landroidx/slice/widget/GridRowView;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/widget/FrameLayout;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Landroidx/slice/widget/GridRowView$a;->g:Landroidx/slice/widget/GridRowView;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput-boolean v0, p0, Landroidx/slice/widget/GridRowView;->B:Z

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0
.end method
