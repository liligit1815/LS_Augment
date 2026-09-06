.class public final synthetic LD1/q;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Landroid/os/UserHandle;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Landroid/os/UserHandle;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LD1/q;->a:Landroid/os/UserHandle;

    .line 5
    .line 6
    iput-object p2, p0, LD1/q;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, LD1/q;->a:Landroid/os/UserHandle;

    .line 2
    .line 3
    iget-object p0, p0, LD1/q;->b:Ljava/lang/String;

    .line 4
    .line 5
    check-cast p1, Ljava/util/function/BiConsumer;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, LD1/t;->h(Landroid/os/UserHandle;Ljava/lang/String;Ljava/util/function/BiConsumer;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
