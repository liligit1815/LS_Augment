.class Lcom/android/launcher3/taskbar/j2$e;
.super Lcom/android/quickstep/util/MultiValueUpdateListener;
.source "TaskbarDragController.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/taskbar/j2;->B0(FFLandroid/view/View;Lcom/android/launcher3/taskbar/j2$f;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final i:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final j:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

.field final synthetic k:F

.field final synthetic l:[I

.field final synthetic m:F

.field final synthetic n:F

.field final synthetic o:F

.field final synthetic p:Lcom/android/launcher3/taskbar/j2$f;


# direct methods
.method constructor <init>(Lcom/android/launcher3/taskbar/j2;F[IFFFLcom/android/launcher3/taskbar/j2$f;)V
    .locals 1

    .line 1
    iput p2, p0, Lcom/android/launcher3/taskbar/j2$e;->k:F

    .line 2
    .line 3
    iput-object p3, p0, Lcom/android/launcher3/taskbar/j2$e;->l:[I

    .line 4
    .line 5
    iput p4, p0, Lcom/android/launcher3/taskbar/j2$e;->m:F

    .line 6
    .line 7
    iput p5, p0, Lcom/android/launcher3/taskbar/j2$e;->n:F

    .line 8
    .line 9
    iput p6, p0, Lcom/android/launcher3/taskbar/j2$e;->o:F

    .line 10
    .line 11
    iput-object p7, p0, Lcom/android/launcher3/taskbar/j2$e;->p:Lcom/android/launcher3/taskbar/j2$f;

    .line 12
    .line 13
    invoke-direct {p0}, Lcom/android/quickstep/util/MultiValueUpdateListener;-><init>()V

    .line 14
    .line 15
    .line 16
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 17
    .line 18
    const/4 p7, 0x0

    .line 19
    aget p7, p3, p7

    .line 20
    .line 21
    int-to-float p7, p7

    .line 22
    sget-object v0, LJ0/h;->r:Landroid/view/animation/Interpolator;

    .line 23
    .line 24
    invoke-direct {p1, p0, p2, p7, v0}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lcom/android/launcher3/taskbar/j2$e;->g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 28
    .line 29
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 30
    .line 31
    const/4 p2, 0x1

    .line 32
    aget p2, p3, p2

    .line 33
    .line 34
    int-to-float p2, p2

    .line 35
    invoke-direct {p1, p0, p4, p2, v0}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Lcom/android/launcher3/taskbar/j2$e;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 39
    .line 40
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 41
    .line 42
    const/high16 p2, 0x3f800000    # 1.0f

    .line 43
    .line 44
    invoke-direct {p1, p0, p2, p5, v0}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 45
    .line 46
    .line 47
    iput-object p1, p0, Lcom/android/launcher3/taskbar/j2$e;->i:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 48
    .line 49
    new-instance p1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 50
    .line 51
    sget-object p3, LJ0/h;->G:Landroid/view/animation/Interpolator;

    .line 52
    .line 53
    invoke-direct {p1, p0, p2, p6, p3}, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;-><init>(Lcom/android/quickstep/util/MultiValueUpdateListener;FFLandroid/view/animation/Interpolator;)V

    .line 54
    .line 55
    .line 56
    iput-object p1, p0, Lcom/android/launcher3/taskbar/j2$e;->j:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 57
    .line 58
    return-void
.end method


# virtual methods
.method public onUpdate(FZ)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/taskbar/j2$e;->p:Lcom/android/launcher3/taskbar/j2$f;

    .line 2
    .line 3
    iget-object p2, p0, Lcom/android/launcher3/taskbar/j2$e;->g:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 4
    .line 5
    iget p2, p2, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 6
    .line 7
    iget-object v0, p0, Lcom/android/launcher3/taskbar/j2$e;->h:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 8
    .line 9
    iget v0, v0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/taskbar/j2$e;->i:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 12
    .line 13
    iget v1, v1, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 14
    .line 15
    iget-object p0, p0, Lcom/android/launcher3/taskbar/j2$e;->j:Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;

    .line 16
    .line 17
    iget p0, p0, Lcom/android/quickstep/util/MultiValueUpdateListener$FloatProp;->value:F

    .line 18
    .line 19
    invoke-interface {p1, p2, v0, v1, p0}, Lcom/android/launcher3/taskbar/j2$f;->a(FFFF)V

    .line 20
    .line 21
    .line 22
    return-void
.end method
