.class public final synthetic Lcom/android/quickstep/views/i;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/IntToDoubleFunction;


# instance fields
.field public final synthetic a:[F


# direct methods
.method public synthetic constructor <init>([F)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/views/i;->a:[F

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final applyAsDouble(I)D
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/views/i;->a:[F

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/android/quickstep/views/FloatingWidgetBackgroundView;->a([FI)D

    .line 4
    .line 5
    .line 6
    move-result-wide p0

    .line 7
    return-wide p0
.end method
