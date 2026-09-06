.class Lcom/zte/mifavor/widget/SegmentScrollView$b;
.super Ljava/lang/Object;
.source "SegmentScrollView.java"

# interfaces
.implements Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/widget/SegmentScrollView;->l(I)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/view/ViewGroup$LayoutParams;

.field final synthetic h:Landroid/widget/TextView;

.field final synthetic i:Landroid/view/View;

.field final synthetic j:Lcom/zte/mifavor/widget/SegmentScrollView;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/SegmentScrollView;Landroid/view/ViewGroup$LayoutParams;Landroid/widget/TextView;Landroid/view/View;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/SegmentScrollView$b;->j:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/zte/mifavor/widget/SegmentScrollView$b;->g:Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/zte/mifavor/widget/SegmentScrollView$b;->h:Landroid/widget/TextView;

    .line 6
    .line 7
    iput-object p4, p0, Lcom/zte/mifavor/widget/SegmentScrollView$b;->i:Landroid/view/View;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onGlobalLayout()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$b;->g:Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/zte/mifavor/widget/SegmentScrollView$b;->h:Landroid/widget/TextView;

    .line 4
    .line 5
    invoke-virtual {v1}, Landroid/widget/TextView;->getWidth()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 10
    .line 11
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$b;->g:Landroid/view/ViewGroup$LayoutParams;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/zte/mifavor/widget/SegmentScrollView$b;->h:Landroid/widget/TextView;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/widget/TextView;->getHeight()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iput v1, v0, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 20
    .line 21
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$b;->j:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 22
    .line 23
    invoke-static {v0}, Lcom/zte/mifavor/widget/SegmentScrollView;->e(Lcom/zte/mifavor/widget/SegmentScrollView;)Landroid/widget/ImageView;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$b;->j:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 30
    .line 31
    invoke-static {v0}, Lcom/zte/mifavor/widget/SegmentScrollView;->e(Lcom/zte/mifavor/widget/SegmentScrollView;)Landroid/widget/ImageView;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v1, p0, Lcom/zte/mifavor/widget/SegmentScrollView$b;->g:Landroid/view/ViewGroup$LayoutParams;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$b;->j:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 41
    .line 42
    invoke-static {v0}, Lcom/zte/mifavor/widget/SegmentScrollView;->e(Lcom/zte/mifavor/widget/SegmentScrollView;)Landroid/widget/ImageView;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    const/4 v1, 0x0

    .line 47
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setTranslationX(F)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$b;->j:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 51
    .line 52
    invoke-static {v0}, Lcom/zte/mifavor/widget/SegmentScrollView;->e(Lcom/zte/mifavor/widget/SegmentScrollView;)Landroid/widget/ImageView;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget-object v1, p0, Lcom/zte/mifavor/widget/SegmentScrollView$b;->i:Landroid/view/View;

    .line 57
    .line 58
    invoke-virtual {v1}, Landroid/view/View;->getX()F

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    iget-object v2, p0, Lcom/zte/mifavor/widget/SegmentScrollView$b;->i:Landroid/view/View;

    .line 63
    .line 64
    invoke-virtual {v2}, Landroid/view/View;->getWidth()I

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    iget-object v3, p0, Lcom/zte/mifavor/widget/SegmentScrollView$b;->h:Landroid/widget/TextView;

    .line 69
    .line 70
    invoke-virtual {v3}, Landroid/widget/TextView;->getWidth()I

    .line 71
    .line 72
    .line 73
    move-result v3

    .line 74
    sub-int/2addr v2, v3

    .line 75
    div-int/lit8 v2, v2, 0x2

    .line 76
    .line 77
    int-to-float v2, v2

    .line 78
    add-float/2addr v1, v2

    .line 79
    invoke-virtual {v0, v1}, Landroid/widget/ImageView;->setX(F)V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$b;->j:Lcom/zte/mifavor/widget/SegmentScrollView;

    .line 83
    .line 84
    invoke-static {v0}, Lcom/zte/mifavor/widget/SegmentScrollView;->e(Lcom/zte/mifavor/widget/SegmentScrollView;)Landroid/widget/ImageView;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-virtual {v0}, Landroid/widget/ImageView;->invalidate()V

    .line 89
    .line 90
    .line 91
    :cond_0
    iget-object v0, p0, Lcom/zte/mifavor/widget/SegmentScrollView$b;->h:Landroid/widget/TextView;

    .line 92
    .line 93
    invoke-virtual {v0}, Landroid/widget/TextView;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    invoke-virtual {v0, p0}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    .line 98
    .line 99
    .line 100
    return-void
.end method
