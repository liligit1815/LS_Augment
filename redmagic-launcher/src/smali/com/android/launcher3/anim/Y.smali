.class public abstract Lcom/android/launcher3/anim/Y;
.super Ljava/lang/Object;
.source "PropertySetter.java"


# static fields
.field public static final a:Lcom/android/launcher3/anim/Y;

.field protected static final b:Landroid/animation/AnimatorSet;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/android/launcher3/anim/Y$a;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/android/launcher3/anim/Y$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/android/launcher3/anim/Y;->a:Lcom/android/launcher3/anim/Y;

    .line 7
    .line 8
    new-instance v0, Landroid/animation/AnimatorSet;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Lcom/android/launcher3/anim/Y;->b:Landroid/animation/AnimatorSet;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public abstract a(Landroid/animation/Animator;)V
.end method

.method public b(Ljava/lang/Object;Landroid/util/FloatProperty;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;",
            "Landroid/util/FloatProperty<",
            "TT;>;F",
            "Landroid/animation/TimeInterpolator;",
            ")",
            "Landroid/animation/Animator;"
        }
    .end annotation

    .line 1
    invoke-virtual {p2, p1, p3}, Landroid/util/FloatProperty;->setValue(Ljava/lang/Object;F)V

    .line 2
    .line 3
    .line 4
    sget-object p0, Lcom/android/launcher3/anim/Y;->b:Landroid/animation/AnimatorSet;

    .line 5
    .line 6
    return-object p0
.end method

.method public c(Landroid/view/View;FLandroid/animation/TimeInterpolator;)Landroid/animation/Animator;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/view/View;->setAlpha(F)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Lcom/android/launcher3/anim/a;->a(Landroid/view/View;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    sget-object p0, Lcom/android/launcher3/anim/Y;->b:Landroid/animation/AnimatorSet;

    .line 10
    .line 11
    return-object p0
.end method

.method public d(Landroid/view/View;ILandroid/animation/TimeInterpolator;)Landroid/animation/Animator;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1, p2}, Landroid/view/View;->setBackgroundColor(I)V

    .line 4
    .line 5
    .line 6
    :cond_0
    sget-object p0, Lcom/android/launcher3/anim/Y;->b:Landroid/animation/AnimatorSet;

    .line 7
    .line 8
    return-object p0
.end method
