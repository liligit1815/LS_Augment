.class public final synthetic LN2/v;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ly/d$c;


# instance fields
.field public final synthetic a:LN2/x;

.field public final synthetic b:Ly/z;


# direct methods
.method public synthetic constructor <init>(LN2/x;Ly/z;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LN2/v;->a:LN2/x;

    .line 5
    .line 6
    iput-object p2, p0, LN2/v;->b:Ly/z;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a(Ly/d;)V
    .locals 1

    .line 1
    iget-object v0, p0, LN2/v;->a:LN2/x;

    .line 2
    .line 3
    iget-object p0, p0, LN2/v;->b:Ly/z;

    .line 4
    .line 5
    invoke-static {v0, p0, p1}, LN2/x;->b(LN2/x;Ly/z;Ly/d;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
