.class public Lc4/b;
.super Lc4/a;
.source "HorizontalOverScrollBounceEffectDecorator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc4/b$b;,
        Lc4/b$a;
    }
.end annotation


# direct methods
.method public constructor <init>(Ld4/c;FFFLandroidx/dynamicanimation/animation/j;Landroid/view/VelocityTracker;)V
    .locals 1

    move v0, p3

    move p3, p2

    move p2, p4

    move p4, v0

    .line 2
    invoke-direct/range {p0 .. p6}, Lc4/a;-><init>(Ld4/c;FFFLandroidx/dynamicanimation/animation/j;Landroid/view/VelocityTracker;)V

    return-void
.end method

.method public constructor <init>(Ld4/c;Landroidx/dynamicanimation/animation/j;Landroid/view/VelocityTracker;)V
    .locals 7

    const/high16 v3, 0x3f800000    # 1.0f

    const/high16 v4, -0x40000000    # -2.0f

    const/high16 v2, 0x3f800000    # 1.0f

    move-object v0, p0

    move-object v1, p1

    move-object v5, p2

    move-object v6, p3

    .line 1
    invoke-direct/range {v0 .. v6}, Lc4/b;-><init>(Ld4/c;FFFLandroidx/dynamicanimation/animation/j;Landroid/view/VelocityTracker;)V

    return-void
.end method


# virtual methods
.method protected C(Landroid/view/View;F)V
    .locals 4

    .line 1
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lc4/a;->h:F

    .line 6
    .line 7
    div-float v1, v0, v1

    .line 8
    .line 9
    const/high16 v2, 0x40600000    # 3.5f

    .line 10
    .line 11
    mul-float/2addr v1, v2

    .line 12
    const/high16 v3, 0x3f800000    # 1.0f

    .line 13
    .line 14
    add-float/2addr v1, v3

    .line 15
    invoke-virtual {p0, v1}, Lc4/a;->B(F)V

    .line 16
    .line 17
    .line 18
    iget v1, p0, Lc4/a;->h:F

    .line 19
    .line 20
    div-float v1, v0, v1

    .line 21
    .line 22
    mul-float/2addr v1, v2

    .line 23
    add-float/2addr v1, v3

    .line 24
    invoke-virtual {p0, v1}, Lc4/a;->A(F)V

    .line 25
    .line 26
    .line 27
    iget v1, p0, Lc4/a;->g:F

    .line 28
    .line 29
    cmpl-float v0, v0, v1

    .line 30
    .line 31
    const-string v1, ", mWidthTreshold = "

    .line 32
    .line 33
    const-string v2, "Z#QScrollBaseDecorator"

    .line 34
    .line 35
    if-lez v0, :cond_0

    .line 36
    .line 37
    new-instance p1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 40
    .line 41
    .line 42
    const-string v0, "translateX View out do nothing. offset = "

    .line 43
    .line 44
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    iget p0, p0, Lc4/a;->g:F

    .line 54
    .line 55
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationX(F)V

    .line 67
    .line 68
    .line 69
    new-instance p1, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    const-string v0, "translateX  View out. offset = "

    .line 75
    .line 76
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    iget p0, p0, Lc4/a;->g:F

    .line 86
    .line 87
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-static {v2, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method protected D(Landroid/view/View;FLandroid/view/MotionEvent;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p2}, Landroid/view/View;->setTranslationX(F)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-virtual {p3, p0}, Landroid/view/MotionEvent;->getX(I)F

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    sub-float p0, p2, p0

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p3, p0, p1}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 13
    .line 14
    .line 15
    new-instance p1, Ljava/lang/StringBuilder;

    .line 16
    .line 17
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 18
    .line 19
    .line 20
    const-string p3, "translateX View And Event out. offset = "

    .line 21
    .line 22
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string p2, ", deltaX = "

    .line 29
    .line 30
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string p1, "Z#QScrollBaseDecorator"

    .line 41
    .line 42
    invoke-static {p1, p0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method protected q()Lc4/a$b;
    .locals 0

    .line 1
    new-instance p0, Lc4/b$a;

    .line 2
    .line 3
    invoke-direct {p0}, Lc4/b$a;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method protected r()Lc4/a$c;
    .locals 0

    .line 1
    new-instance p0, Lc4/b$b;

    .line 2
    .line 3
    invoke-direct {p0}, Lc4/b$b;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
