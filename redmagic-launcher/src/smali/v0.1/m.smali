.class public final synthetic Lv0/m;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lv0/r;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ljava/util/concurrent/atomic/AtomicBoolean;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ljava/util/concurrent/atomic/AtomicBoolean;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lv0/m;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Lv0/m;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onResult(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv0/m;->a:Ljava/lang/String;

    .line 2
    .line 3
    iget-object p0, p0, Lv0/m;->b:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 4
    .line 5
    check-cast p1, Lv0/h;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, Lv0/p;->f(Ljava/lang/String;Ljava/util/concurrent/atomic/AtomicBoolean;Lv0/h;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
