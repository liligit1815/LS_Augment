.class Lcom/android/launcher3/iconarrange/a$c;
.super Ljava/lang/Object;
.source "DragonDrawable.java"

# interfaces
.implements Landroid/animation/ValueAnimator$AnimatorUpdateListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/iconarrange/a;->l()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/iconarrange/a;


# direct methods
.method constructor <init>(Lcom/android/launcher3/iconarrange/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/iconarrange/a$c;->g:Lcom/android/launcher3/iconarrange/a;

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
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/a$c;->g:Lcom/android/launcher3/iconarrange/a;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-static {v0, p1}, Lcom/android/launcher3/iconarrange/a;->e(Lcom/android/launcher3/iconarrange/a;I)V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/android/launcher3/iconarrange/a$c;->g:Lcom/android/launcher3/iconarrange/a;

    .line 17
    .line 18
    invoke-static {p1}, Lcom/android/launcher3/iconarrange/a;->b(Lcom/android/launcher3/iconarrange/a;)[I

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    iget-object v0, p0, Lcom/android/launcher3/iconarrange/a$c;->g:Lcom/android/launcher3/iconarrange/a;

    .line 23
    .line 24
    invoke-static {v0}, Lcom/android/launcher3/iconarrange/a;->c(Lcom/android/launcher3/iconarrange/a;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/4 v1, 0x0

    .line 29
    aput v0, p1, v1

    .line 30
    .line 31
    iget-object p0, p0, Lcom/android/launcher3/iconarrange/a$c;->g:Lcom/android/launcher3/iconarrange/a;

    .line 32
    .line 33
    invoke-static {p0}, Lcom/android/launcher3/iconarrange/a;->a(Lcom/android/launcher3/iconarrange/a;)Lcom/android/launcher3/dragndrop/v;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->invalidate()V

    .line 38
    .line 39
    .line 40
    return-void
.end method
