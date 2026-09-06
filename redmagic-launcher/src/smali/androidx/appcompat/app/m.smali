.class public final synthetic Landroidx/appcompat/app/m;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Landroidx/appcompat/app/n$a;

.field public final synthetic h:Ljava/lang/Runnable;


# direct methods
.method public synthetic constructor <init>(Landroidx/appcompat/app/n$a;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Landroidx/appcompat/app/m;->g:Landroidx/appcompat/app/n$a;

    .line 5
    .line 6
    iput-object p2, p0, Landroidx/appcompat/app/m;->h:Ljava/lang/Runnable;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    .line 1
    iget-object v0, p0, Landroidx/appcompat/app/m;->g:Landroidx/appcompat/app/n$a;

    .line 2
    .line 3
    iget-object p0, p0, Landroidx/appcompat/app/m;->h:Ljava/lang/Runnable;

    .line 4
    .line 5
    invoke-static {v0, p0}, Landroidx/appcompat/app/n$a;->a(Landroidx/appcompat/app/n$a;Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
