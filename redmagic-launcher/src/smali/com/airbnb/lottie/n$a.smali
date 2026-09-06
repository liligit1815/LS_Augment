.class Lcom/airbnb/lottie/n$a;
.super Ljava/lang/Object;
.source "LottieDrawable.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/airbnb/lottie/n;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/airbnb/lottie/n;


# direct methods
.method constructor <init>(Lcom/airbnb/lottie/n;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/airbnb/lottie/n$a;->g:Lcom/airbnb/lottie/n;

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
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/airbnb/lottie/n$a;->g:Lcom/airbnb/lottie/n;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/airbnb/lottie/n;->n(Lcom/airbnb/lottie/n;)LD0/c;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/airbnb/lottie/n$a;->g:Lcom/airbnb/lottie/n;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/airbnb/lottie/n;->n(Lcom/airbnb/lottie/n;)LD0/c;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p0, p0, Lcom/airbnb/lottie/n$a;->g:Lcom/airbnb/lottie/n;

    .line 16
    .line 17
    invoke-static {p0}, Lcom/airbnb/lottie/n;->o(Lcom/airbnb/lottie/n;)LH0/e;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, LH0/e;->l()F

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-virtual {p1, p0}, LD0/c;->L(F)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method
