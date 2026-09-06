.class public final synthetic LO0/p;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:LO0/r;

.field public final synthetic b:Lcom/android/launcher3/model/data/m;


# direct methods
.method public synthetic constructor <init>(LO0/r;Lcom/android/launcher3/model/data/m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LO0/p;->a:LO0/r;

    .line 5
    .line 6
    iput-object p2, p0, LO0/p;->b:Lcom/android/launcher3/model/data/m;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, LO0/p;->a:LO0/r;

    .line 2
    .line 3
    iget-object p0, p0, LO0/p;->b:Lcom/android/launcher3/model/data/m;

    .line 4
    .line 5
    check-cast p1, Lcom/android/launcher3/model/data/y;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, LO0/r;->o(LO0/r;Lcom/android/launcher3/model/data/m;Lcom/android/launcher3/model/data/y;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
