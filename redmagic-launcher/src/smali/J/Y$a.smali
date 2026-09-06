.class public final LJ/Y$a;
.super Ljava/lang/Object;
.source "WindowInsetsCompat.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LJ/Y;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field private final a:LJ/Y$d;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, LJ/Y$c;

    invoke-direct {v0}, LJ/Y$c;-><init>()V

    iput-object v0, p0, LJ/Y$a;->a:LJ/Y$d;

    return-void
.end method

.method public constructor <init>(LJ/Y;)V
    .locals 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    new-instance v0, LJ/Y$c;

    invoke-direct {v0, p1}, LJ/Y$c;-><init>(LJ/Y;)V

    iput-object v0, p0, LJ/Y$a;->a:LJ/Y$d;

    return-void
.end method


# virtual methods
.method public a()LJ/Y;
    .locals 0

    .line 1
    iget-object p0, p0, LJ/Y$a;->a:LJ/Y$d;

    .line 2
    .line 3
    invoke-virtual {p0}, LJ/Y$d;->b()LJ/Y;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public b(LB/b;)LJ/Y$a;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, LJ/Y$a;->a:LJ/Y$d;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, LJ/Y$d;->d(LB/b;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public c(LB/b;)LJ/Y$a;
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iget-object v0, p0, LJ/Y$a;->a:LJ/Y$d;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, LJ/Y$d;->f(LB/b;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method
