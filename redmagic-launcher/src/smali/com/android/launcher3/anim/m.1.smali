.class public final synthetic Lcom/android/launcher3/anim/m;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Landroid/animation/TimeInterpolator;


# direct methods
.method public synthetic constructor <init>(Landroid/animation/TimeInterpolator;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/launcher3/anim/m;->a:Landroid/animation/TimeInterpolator;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/anim/m;->a:Landroid/animation/TimeInterpolator;

    .line 2
    .line 3
    check-cast p1, Landroid/animation/Animator;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/android/launcher3/anim/q;->c(Landroid/animation/TimeInterpolator;Landroid/animation/Animator;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
