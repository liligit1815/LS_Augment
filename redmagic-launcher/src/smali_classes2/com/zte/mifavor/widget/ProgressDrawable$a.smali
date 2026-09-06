.class Lcom/zte/mifavor/widget/ProgressDrawable$a;
.super Ljava/lang/Object;
.source "ProgressDrawable.java"

# interfaces
.implements Landroid/animation/TimeAnimator$TimeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/widget/ProgressDrawable;->generateTimeAnimtor()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/zte/mifavor/widget/ProgressDrawable;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/ProgressDrawable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/ProgressDrawable$a;->a:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onTimeUpdate(Landroid/animation/TimeAnimator;JJ)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/zte/mifavor/widget/ProgressDrawable$a;->a:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/zte/mifavor/widget/ProgressDrawable;->h(Lcom/zte/mifavor/widget/ProgressDrawable;)F

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const-wide/16 v2, 0x78

    .line 8
    .line 9
    mul-long/2addr p4, v2

    .line 10
    long-to-float p4, p4

    .line 11
    const/high16 p5, 0x447a0000    # 1000.0f

    .line 12
    .line 13
    div-float/2addr p4, p5

    .line 14
    add-float/2addr v1, p4

    .line 15
    const/high16 p4, 0x43b40000    # 360.0f

    .line 16
    .line 17
    rem-float/2addr v1, p4

    .line 18
    invoke-static {v0, v1}, Lcom/zte/mifavor/widget/ProgressDrawable;->o(Lcom/zte/mifavor/widget/ProgressDrawable;F)V

    .line 19
    .line 20
    .line 21
    new-instance p4, Landroid/view/animation/PathInterpolator;

    .line 22
    .line 23
    const/4 p5, 0x0

    .line 24
    const/high16 v0, 0x3f800000    # 1.0f

    .line 25
    .line 26
    const/high16 v1, 0x3f000000    # 0.5f

    .line 27
    .line 28
    invoke-direct {p4, v1, p5, v1, v0}, Landroid/view/animation/PathInterpolator;-><init>(FFFF)V

    .line 29
    .line 30
    .line 31
    long-to-float p5, p2

    .line 32
    const v0, 0x450fc000    # 2300.0f

    .line 33
    .line 34
    .line 35
    div-float/2addr p5, v0

    .line 36
    invoke-virtual {p4, p5}, Landroid/view/animation/PathInterpolator;->getInterpolation(F)F

    .line 37
    .line 38
    .line 39
    move-result p4

    .line 40
    iget-object p0, p0, Lcom/zte/mifavor/widget/ProgressDrawable$a;->a:Lcom/zte/mifavor/widget/ProgressDrawable;

    .line 41
    .line 42
    invoke-static {p0, p4}, Lcom/zte/mifavor/widget/ProgressDrawable;->p(Lcom/zte/mifavor/widget/ProgressDrawable;F)V

    .line 43
    .line 44
    .line 45
    const-wide/16 p4, 0x8fc

    .line 46
    .line 47
    cmp-long p0, p2, p4

    .line 48
    .line 49
    if-ltz p0, :cond_0

    .line 50
    .line 51
    const-wide/16 p2, 0x0

    .line 52
    .line 53
    invoke-virtual {p1, p2, p3}, Landroid/animation/TimeAnimator;->setCurrentPlayTime(J)V

    .line 54
    .line 55
    .line 56
    :cond_0
    return-void
.end method
