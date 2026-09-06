.class Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;
.super Ljava/lang/Object;
.source "AIBubbleWidgetBubbleContainer.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "i"
.end annotation


# instance fields
.field private final a:F

.field private final b:F

.field private final c:F

.field private final d:I

.field private final e:F

.field private final f:F


# direct methods
.method private constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;Ljava/util/Random;)V
    .locals 5

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-nez p2, :cond_0

    .line 3
    new-instance p2, Ljava/util/Random;

    invoke-direct {p2}, Ljava/util/Random;-><init>()V

    .line 4
    :cond_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x41200000    # 10.0f

    invoke-static {v0, v1}, Lx1/O;->F(Landroid/content/Context;F)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;->e:F

    .line 5
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v0

    const/high16 v1, 0x41300000    # 11.0f

    invoke-static {v0, v1}, Lx1/O;->F(Landroid/content/Context;F)I

    move-result v0

    int-to-float v0, v0

    iput v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;->f:F

    const/16 v0, 0x190

    .line 6
    invoke-virtual {p2, v0}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x3f800000    # 1.0f

    mul-float/2addr v1, v2

    const/high16 v3, 0x447a0000    # 1000.0f

    div-float/2addr v1, v3

    const v4, 0x3e4ccccd    # 0.2f

    add-float/2addr v1, v4

    iput v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;->a:F

    .line 7
    invoke-virtual {p2, v0}, Ljava/util/Random;->nextInt(I)I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v2

    div-float/2addr v1, v3

    add-float/2addr v1, v4

    iput v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;->b:F

    .line 8
    invoke-virtual {p2, v0}, Ljava/util/Random;->nextInt(I)I

    move-result p2

    int-to-float p2, p2

    mul-float/2addr p2, v2

    div-float/2addr p2, v3

    add-float/2addr p2, v4

    iput p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;->c:F

    .line 9
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    instance-of p2, p2, Landroid/view/ViewGroup;

    if-eqz p2, :cond_1

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    check-cast p2, Landroid/view/ViewGroup;

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->indexOfChild(Landroid/view/View;)I

    move-result p1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    :goto_0
    add-int/lit8 p1, p1, 0x1

    .line 10
    iput p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;->d:I

    return-void
.end method

.method synthetic constructor <init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;Ljava/util/Random;Lcom/android/launcher3/widget/custom/bubble/g;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;-><init>(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleView;Ljava/util/Random;)V

    return-void
.end method

.method static bridge synthetic a(Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;J)Landroid/graphics/PointF;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;->b(J)Landroid/graphics/PointF;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private b(J)Landroid/graphics/PointF;
    .locals 7

    .line 1
    const/high16 v0, 0x3f800000    # 1.0f

    .line 2
    .line 3
    long-to-float p1, p1

    .line 4
    mul-float/2addr p1, v0

    .line 5
    invoke-static {}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->t()I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    int-to-float p2, p2

    .line 10
    iget v0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;->a:F

    .line 11
    .line 12
    div-float/2addr p2, v0

    .line 13
    div-float p2, p1, p2

    .line 14
    .line 15
    const/high16 v0, 0x40000000    # 2.0f

    .line 16
    .line 17
    mul-float/2addr p2, v0

    .line 18
    float-to-double v1, p2

    .line 19
    const-wide v3, 0x400921fb54442d18L    # Math.PI

    .line 20
    .line 21
    .line 22
    .line 23
    .line 24
    mul-double/2addr v1, v3

    .line 25
    iget p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;->d:I

    .line 26
    .line 27
    int-to-double v5, p2

    .line 28
    add-double/2addr v1, v5

    .line 29
    invoke-static {v1, v2}, Ljava/lang/Math;->cos(D)D

    .line 30
    .line 31
    .line 32
    move-result-wide v1

    .line 33
    iget p2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;->e:F

    .line 34
    .line 35
    float-to-double v5, p2

    .line 36
    mul-double/2addr v1, v5

    .line 37
    invoke-static {v1, v2}, Ljava/lang/Math;->round(D)J

    .line 38
    .line 39
    .line 40
    move-result-wide v1

    .line 41
    long-to-float p2, v1

    .line 42
    invoke-static {}, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer;->t()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    int-to-float v1, v1

    .line 47
    iget v2, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;->b:F

    .line 48
    .line 49
    div-float/2addr v1, v2

    .line 50
    div-float/2addr p1, v1

    .line 51
    mul-float/2addr p1, v0

    .line 52
    float-to-double v0, p1

    .line 53
    mul-double/2addr v0, v3

    .line 54
    iget p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;->d:I

    .line 55
    .line 56
    int-to-double v2, p1

    .line 57
    add-double/2addr v0, v2

    .line 58
    iget p1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;->c:F

    .line 59
    .line 60
    float-to-double v2, p1

    .line 61
    add-double/2addr v0, v2

    .line 62
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    .line 63
    .line 64
    .line 65
    move-result-wide v0

    .line 66
    iget p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;->f:F

    .line 67
    .line 68
    float-to-double p0, p0

    .line 69
    mul-double/2addr v0, p0

    .line 70
    invoke-static {v0, v1}, Ljava/lang/Math;->round(D)J

    .line 71
    .line 72
    .line 73
    move-result-wide p0

    .line 74
    long-to-float p0, p0

    .line 75
    new-instance p1, Landroid/graphics/PointF;

    .line 76
    .line 77
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 78
    .line 79
    .line 80
    move-result p2

    .line 81
    int-to-float p2, p2

    .line 82
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    int-to-float p0, p0

    .line 87
    invoke-direct {p1, p2, p0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 88
    .line 89
    .line 90
    return-object p1
.end method


# virtual methods
.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "FloatingParams{a1="

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;->a:F

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, ", a2="

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;->b:F

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v1, ", a3="

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    iget v1, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;->c:F

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v1, ", b="

    .line 37
    .line 38
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget p0, p0, Lcom/android/launcher3/widget/custom/bubble/AIBubbleWidgetBubbleContainer$i;->d:I

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string p0, "}"

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    return-object p0
.end method
