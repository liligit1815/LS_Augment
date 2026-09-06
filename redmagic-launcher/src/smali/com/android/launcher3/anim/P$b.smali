.class Lcom/android/launcher3/anim/P$b;
.super Ljava/lang/Object;
.source "MFVLauncherAppTransitionHelper.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/anim/P;->p([Lu2/s;[Lu2/s;[Lu2/s;Landroid/graphics/RectF;Landroid/view/View;Lcom/android/quickstep/util/animation/MultiAnimatorSet;Lcom/android/launcher3/M2$a;Landroid/graphics/RectF;F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;


# direct methods
.method constructor <init>(Lcom/android/launcher3/anim/P;Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/anim/P$b;->g:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/P$b;->g:Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/android/launcher3/anim/P;->r(Lcom/android/quickstep/util/animation/CustomRectFSpringAnim;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
