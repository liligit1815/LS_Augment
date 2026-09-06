.class Lcom/zte/mifavor/widget/MenuScrollerView$a$a;
.super Ljava/lang/Object;
.source "MenuScrollerView.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/zte/mifavor/widget/MenuScrollerView$a;->b(LW2/e;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/zte/mifavor/widget/MenuScrollerView$a;


# direct methods
.method constructor <init>(Lcom/zte/mifavor/widget/MenuScrollerView$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/zte/mifavor/widget/MenuScrollerView$a$a;->g:Lcom/zte/mifavor/widget/MenuScrollerView$a;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAnimationUpdate(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v1, "+++++++++++ Update value Animator. value = "

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    const-string v1, "Scroll#MenuScrollerView"

    .line 29
    .line 30
    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Lcom/zte/mifavor/widget/MenuScrollerView$a$a;->g:Lcom/zte/mifavor/widget/MenuScrollerView$a;

    .line 34
    .line 35
    iget-object v0, v0, Lcom/zte/mifavor/widget/MenuScrollerView$a;->b:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 36
    .line 37
    invoke-static {v0}, Lcom/zte/mifavor/widget/MenuScrollerView;->b(Lcom/zte/mifavor/widget/MenuScrollerView;)Lcom/zte/mifavor/widget/q;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    if-eqz v0, :cond_0

    .line 42
    .line 43
    iget-object p0, p0, Lcom/zte/mifavor/widget/MenuScrollerView$a$a;->g:Lcom/zte/mifavor/widget/MenuScrollerView$a;

    .line 44
    .line 45
    iget-object p0, p0, Lcom/zte/mifavor/widget/MenuScrollerView$a;->b:Lcom/zte/mifavor/widget/MenuScrollerView;

    .line 46
    .line 47
    invoke-static {p0}, Lcom/zte/mifavor/widget/MenuScrollerView;->b(Lcom/zte/mifavor/widget/MenuScrollerView;)Lcom/zte/mifavor/widget/q;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    invoke-virtual {p0}, Lcom/zte/mifavor/widget/q;->h()LW2/e;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    if-eqz p0, :cond_0

    .line 56
    .line 57
    float-to-double v0, p1

    .line 58
    invoke-virtual {p0, v0, v1}, LW2/e;->n(D)LW2/e;

    .line 59
    .line 60
    .line 61
    :cond_0
    return-void
.end method
