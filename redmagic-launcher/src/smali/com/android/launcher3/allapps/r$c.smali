.class Lcom/android/launcher3/allapps/r$c;
.super Landroid/animation/AnimatorListenerAdapter;
.source "ActivityAllAppsContainerView.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/allapps/r;->E(Landroid/animation/ValueAnimator;FF)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:F

.field final synthetic h:F

.field final synthetic i:Lcom/android/launcher3/allapps/r;


# direct methods
.method constructor <init>(Lcom/android/launcher3/allapps/r;FF)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/allapps/r$c;->i:Lcom/android/launcher3/allapps/r;

    .line 2
    .line 3
    iput p2, p0, Lcom/android/launcher3/allapps/r$c;->g:F

    .line 4
    .line 5
    iput p3, p0, Lcom/android/launcher3/allapps/r$c;->h:F

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/animation/AnimatorListenerAdapter;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationStart(Landroid/animation/Animator;)V
    .locals 3

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    iget v1, p0, Lcom/android/launcher3/allapps/r$c;->g:F

    .line 4
    .line 5
    sub-float/2addr v0, v1

    .line 6
    iget-object v1, p0, Lcom/android/launcher3/allapps/r$c;->i:Lcom/android/launcher3/allapps/r;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/widget/RelativeLayout;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    int-to-float v1, v1

    .line 13
    mul-float/2addr v0, v1

    .line 14
    invoke-virtual {p1}, Landroid/animation/Animator;->getDuration()J

    .line 15
    .line 16
    .line 17
    move-result-wide v1

    .line 18
    long-to-float p1, v1

    .line 19
    const v1, 0x3fd9999a    # 1.7f

    .line 20
    .line 21
    .line 22
    mul-float/2addr p1, v1

    .line 23
    div-float/2addr v0, p1

    .line 24
    iget p1, p0, Lcom/android/launcher3/allapps/r$c;->h:F

    .line 25
    .line 26
    add-float/2addr v0, p1

    .line 27
    const/4 p1, 0x0

    .line 28
    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iget-object v0, p0, Lcom/android/launcher3/allapps/r$c;->i:Lcom/android/launcher3/allapps/r;

    .line 33
    .line 34
    const/high16 v1, 0x44960000    # 1200.0f

    .line 35
    .line 36
    mul-float/2addr p1, v1

    .line 37
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 38
    .line 39
    .line 40
    move-result p1

    .line 41
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    const/16 v1, 0x3e8

    .line 46
    .line 47
    invoke-static {v1, p1}, Ljava/lang/Math;->max(II)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    invoke-static {v0, p1}, Lcom/android/launcher3/allapps/r;->D(Lcom/android/launcher3/allapps/r;I)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/android/launcher3/allapps/r$c;->i:Lcom/android/launcher3/allapps/r;

    .line 55
    .line 56
    const p1, 0x7f0b025d

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0, p1}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    instance-of p1, p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;

    .line 64
    .line 65
    if-eqz p1, :cond_0

    .line 66
    .line 67
    check-cast p0, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;

    .line 68
    .line 69
    invoke-virtual {p0}, Lcom/android/launcher3/allappsfastscroller/AlphabeticalScroller;->w()V

    .line 70
    .line 71
    .line 72
    :cond_0
    return-void
.end method
