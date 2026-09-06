.class public final synthetic Lcom/android/quickstep/w1;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lx1/r;


# direct methods
.method public synthetic constructor <init>(Lx1/r;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/android/quickstep/w1;->a:Lx1/r;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/quickstep/w1;->a:Lx1/r;

    .line 2
    .line 3
    check-cast p1, Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-static {p0, p1}, Lcom/android/quickstep/LauncherSwipeHandlerV2;->w0(Lx1/r;Ljava/lang/Boolean;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
