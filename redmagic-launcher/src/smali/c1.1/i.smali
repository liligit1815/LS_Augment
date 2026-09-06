.class public final synthetic Lc1/i;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/BiConsumer;


# instance fields
.field public final synthetic a:Lc1/j;


# direct methods
.method public synthetic constructor <init>(Lc1/j;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lc1/i;->a:Lc1/j;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lc1/i;->a:Lc1/j;

    .line 2
    .line 3
    check-cast p1, Landroid/view/View;

    .line 4
    .line 5
    check-cast p2, Lcom/android/launcher3/util/C;

    .line 6
    .line 7
    invoke-static {p0, p1, p2}, Lc1/j;->v(Lc1/j;Landroid/view/View;Lcom/android/launcher3/util/C;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
