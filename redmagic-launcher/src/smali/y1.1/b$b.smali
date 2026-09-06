.class Ly1/b$b;
.super Ljava/lang/Object;
.source "LauncherClient.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ly1/b;->J()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:Ly1/b;


# direct methods
.method constructor <init>(Ly1/b;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ly1/b$b;->g:Ly1/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object p0, p0, Ly1/b$b;->g:Ly1/b;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-static {p0, v0}, Ly1/b;->k(Ly1/b;I)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
