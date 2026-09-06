.class public final synthetic La1/b;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic g:Landroid/content/Context;

.field public final synthetic h:Landroid/net/Uri;

.field public final synthetic i:I


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Landroid/net/Uri;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, La1/b;->g:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, La1/b;->h:Landroid/net/Uri;

    .line 7
    .line 8
    iput p3, p0, La1/b;->i:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, La1/b;->g:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, La1/b;->h:Landroid/net/Uri;

    .line 4
    .line 5
    iget p0, p0, La1/b;->i:I

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, La1/d;->b(Landroid/content/Context;Landroid/net/Uri;I)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
