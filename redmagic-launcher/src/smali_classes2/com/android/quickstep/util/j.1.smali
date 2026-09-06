.class public final synthetic Lcom/android/quickstep/util/j;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Landroid/animation/TimeInterpolator;


# instance fields
.field public final synthetic a:F

.field public final synthetic b:F

.field public final synthetic c:F


# direct methods
.method public synthetic constructor <init>(FFF)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/android/quickstep/util/j;->a:F

    .line 5
    .line 6
    iput p2, p0, Lcom/android/quickstep/util/j;->b:F

    .line 7
    .line 8
    iput p3, p0, Lcom/android/quickstep/util/j;->c:F

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final getInterpolation(F)F
    .locals 2

    .line 1
    iget v0, p0, Lcom/android/quickstep/util/j;->a:F

    .line 2
    .line 3
    iget v1, p0, Lcom/android/quickstep/util/j;->b:F

    .line 4
    .line 5
    iget p0, p0, Lcom/android/quickstep/util/j;->c:F

    .line 6
    .line 7
    invoke-static {v0, v1, p0, p1}, Lcom/android/quickstep/util/AnimatorControllerWithResistance;->a(FFFF)F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
