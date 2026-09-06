.class Lcom/android/launcher3/anim/P$d;
.super Ljava/lang/Object;
.source "MFVLauncherAppTransitionHelper.java"

# interfaces
.implements Lu4/l;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/android/launcher3/anim/P;->p([Lu2/s;[Lu2/s;[Lu2/s;Landroid/graphics/RectF;Landroid/view/View;Lcom/android/quickstep/util/animation/MultiAnimatorSet;Lcom/android/launcher3/M2$a;Landroid/graphics/RectF;F)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lu4/l<",
        "Ljava/lang/Boolean;",
        "Lcom/android/quickstep/util/anim/IconSurfaceLockObject;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic g:Lcom/android/launcher3/views/FloatingIconView;


# direct methods
.method constructor <init>(Lcom/android/launcher3/anim/P;Lcom/android/launcher3/views/FloatingIconView;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Lcom/android/launcher3/anim/P$d;->g:Lcom/android/launcher3/views/FloatingIconView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/Boolean;)Lcom/android/quickstep/util/anim/IconSurfaceLockObject;
    .locals 0

    .line 1
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/P$d;->b(Z)V

    .line 6
    .line 7
    .line 8
    sget-object p0, Lcom/android/quickstep/util/anim/IconSurfaceLockObject;->INSTANCE:Lcom/android/quickstep/util/anim/IconSurfaceLockObject;

    .line 9
    .line 10
    return-object p0
.end method

.method public final b(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/anim/P$d;->a(Ljava/lang/Boolean;)Lcom/android/quickstep/util/anim/IconSurfaceLockObject;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
