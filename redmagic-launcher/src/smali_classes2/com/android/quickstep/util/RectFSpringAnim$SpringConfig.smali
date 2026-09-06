.class abstract Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;
.super Ljava/lang/Object;
.source "RectFSpringAnim.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/quickstep/util/RectFSpringAnim;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x40a
    name = "SpringConfig"
.end annotation


# instance fields
.field protected dampingX:F

.field protected dampingY:F

.field protected homeAnimTargetType:I

.field protected maxVelocityPxPerS:I

.field protected minVisChange:F

.field protected rectDamping:F

.field protected rectStiffness:F

.field protected startRect:Landroid/graphics/RectF;

.field protected stiffnessX:F

.field protected stiffnessY:F

.field protected targetRect:Landroid/graphics/RectF;

.field protected tracking:I


# direct methods
.method private constructor <init>(Landroid/content/Context;Landroid/graphics/RectF;Landroid/graphics/RectF;)V
    .locals 0

    .line 2
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 3
    iput-object p2, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->startRect:Landroid/graphics/RectF;

    .line 4
    iput-object p3, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->targetRect:Landroid/graphics/RectF;

    .line 5
    invoke-static {p1}, Lcom/android/launcher3/util/g0;->i(Landroid/content/Context;)Lx2/h;

    move-result-object p1

    const p2, 0x7f070abc

    .line 6
    invoke-interface {p1, p2}, Lx2/h;->a(I)F

    move-result p2

    iput p2, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->minVisChange:F

    const p2, 0x7f070abd

    .line 7
    invoke-interface {p1, p2}, Lx2/h;->a(I)F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;->maxVelocityPxPerS:I

    return-void
.end method

.method synthetic constructor <init>(Landroid/content/Context;Landroid/graphics/RectF;Landroid/graphics/RectF;Lcom/android/quickstep/util/F0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/android/quickstep/util/RectFSpringAnim$SpringConfig;-><init>(Landroid/content/Context;Landroid/graphics/RectF;Landroid/graphics/RectF;)V

    return-void
.end method
