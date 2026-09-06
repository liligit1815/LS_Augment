.class public final LJ/C;
.super Ljava/lang/Object;
.source "SoftwareKeyboardControllerCompat.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        LJ/C$b;,
        LJ/C$c;,
        LJ/C$a;
    }
.end annotation


# instance fields
.field private final a:LJ/C$c;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, LJ/C$b;

    invoke-direct {v0, p1}, LJ/C$b;-><init>(Landroid/view/View;)V

    iput-object v0, p0, LJ/C;->a:LJ/C$c;

    return-void
.end method

.method constructor <init>(Landroid/view/WindowInsetsController;)V
    .locals 1
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    new-instance v0, LJ/C$b;

    invoke-direct {v0, p1}, LJ/C$b;-><init>(Landroid/view/WindowInsetsController;)V

    iput-object v0, p0, LJ/C;->a:LJ/C$c;

    return-void
.end method


# virtual methods
.method public a()V
    .locals 0

    .line 1
    iget-object p0, p0, LJ/C;->a:LJ/C$c;

    .line 2
    .line 3
    invoke-virtual {p0}, LJ/C$c;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public b()V
    .locals 0

    .line 1
    iget-object p0, p0, LJ/C;->a:LJ/C$c;

    .line 2
    .line 3
    invoke-virtual {p0}, LJ/C$c;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
