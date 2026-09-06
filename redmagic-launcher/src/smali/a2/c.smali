.class public final synthetic La2/c;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:La2/e;


# direct methods
.method public synthetic constructor <init>(La2/e;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, La2/c;->a:La2/e;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, La2/c;->a:La2/e;

    .line 2
    .line 3
    check-cast p1, La2/a;

    .line 4
    .line 5
    invoke-static {p0, p1}, La2/e;->b(La2/e;La2/a;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
