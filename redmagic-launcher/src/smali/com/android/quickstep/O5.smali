.class public final synthetic Lcom/android/quickstep/O5;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/BiConsumer;


# instance fields
.field public final synthetic a:Ljava/io/PrintWriter;


# direct methods
.method public synthetic constructor <init>(Ljava/io/PrintWriter;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/O5;->a:Ljava/io/PrintWriter;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/O5;->a:Ljava/io/PrintWriter;

    .line 2
    .line 3
    check-cast p1, Ljava/lang/Integer;

    .line 4
    .line 5
    check-cast p2, Lcom/android/wm/shell/shared/i;

    .line 6
    .line 7
    invoke-static {p0, p1, p2}, Lcom/android/quickstep/TopTaskTracker;->u2(Ljava/io/PrintWriter;Ljava/lang/Integer;Lcom/android/wm/shell/shared/i;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
