.class public final synthetic LG1/c;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic a:Lu4/a;

.field public final synthetic b:LG1/d;


# direct methods
.method public synthetic constructor <init>(Lu4/a;LG1/d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LG1/c;->a:Lu4/a;

    .line 5
    .line 6
    iput-object p2, p0, LG1/c;->b:LG1/d;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .locals 1

    .line 1
    iget-object v0, p0, LG1/c;->a:Lu4/a;

    .line 2
    .line 3
    iget-object p0, p0, LG1/c;->b:LG1/d;

    .line 4
    .line 5
    check-cast p1, Ljava/util/List;

    .line 6
    .line 7
    invoke-static {v0, p0, p1}, LG1/d;->b(Lu4/a;LG1/d;Ljava/util/List;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
