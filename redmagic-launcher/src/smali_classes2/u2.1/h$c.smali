.class public final Lu2/h$c;
.super Ljava/lang/Object;
.source "GhostedViewTransitionAnimatorController.kt"

# interfaces
.implements Landroid/view/View$OnAttachStateChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lu2/h;-><init>(Landroid/view/View;Ljava/lang/Integer;Lu2/c$f;Landroid/content/ComponentName;Ljava/lang/Integer;ZLcom/android/internal/jank/InteractionJankMonitor;Lu2/i;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic g:Lu2/h;


# direct methods
.method constructor <init>(Lu2/h;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lu2/h$c;->g:Lu2/h;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onViewAttachedToWindow(Landroid/view/View;)V
    .locals 0

    .line 1
    const-string p0, "v"

    .line 2
    .line 3
    invoke-static {p1, p0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onViewDetachedFromWindow(Landroid/view/View;)V
    .locals 1

    .line 1
    const-string v0, "v"

    .line 2
    .line 3
    invoke-static {p1, v0}, Lkotlin/jvm/internal/o;->f(Ljava/lang/Object;Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lu2/h$c;->g:Lu2/h;

    .line 7
    .line 8
    invoke-virtual {p0}, Lu2/h;->x()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
