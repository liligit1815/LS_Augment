.class public final synthetic LG1/a;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Lu4/a;


# instance fields
.field public final synthetic g:LG1/d;

.field public final synthetic h:Landroid/content/Context;


# direct methods
.method public synthetic constructor <init>(LG1/d;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, LG1/a;->g:LG1/d;

    .line 5
    .line 6
    iput-object p2, p0, LG1/a;->h:Landroid/content/Context;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, LG1/a;->g:LG1/d;

    .line 2
    .line 3
    iget-object p0, p0, LG1/a;->h:Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {v0, p0}, LG1/d;->a(LG1/d;Landroid/content/Context;)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method
