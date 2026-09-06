.class Lcom/android/launcher3/anim/f0$a;
.super Lcom/android/launcher3/anim/g;
.source "SpringAnimationBuilder.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/anim/f0;->c(Ljava/lang/Object;Landroid/util/FloatProperty;)Landroid/animation/ValueAnimator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Landroid/util/FloatProperty;

.field final synthetic h:Ljava/lang/Object;

.field final synthetic i:Lcom/android/launcher3/anim/f0;


# direct methods
.method constructor <init>(Lcom/android/launcher3/anim/f0;Landroid/util/FloatProperty;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/anim/f0$a;->i:Lcom/android/launcher3/anim/f0;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/android/launcher3/anim/f0$a;->g:Landroid/util/FloatProperty;

    .line 4
    .line 5
    iput-object p3, p0, Lcom/android/launcher3/anim/f0$a;->h:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-direct {p0}, Lcom/android/launcher3/anim/g;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public onAnimationSuccess(Landroid/animation/Animator;)V
    .locals 1

    .line 1
    iget-object p1, p0, Lcom/android/launcher3/anim/f0$a;->g:Landroid/util/FloatProperty;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/android/launcher3/anim/f0$a;->h:Ljava/lang/Object;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/android/launcher3/anim/f0$a;->i:Lcom/android/launcher3/anim/f0;

    .line 6
    .line 7
    invoke-static {p0}, Lcom/android/launcher3/anim/f0;->b(Lcom/android/launcher3/anim/f0;)F

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-virtual {p1, v0, p0}, Landroid/util/FloatProperty;->set(Ljava/lang/Object;Ljava/lang/Float;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
