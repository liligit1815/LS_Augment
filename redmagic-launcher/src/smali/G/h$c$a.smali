.class LG/h$c$a;
.super Ljava/lang/Object;
.source "RequestExecutor.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = LG/h$c;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:LI/a;

.field final synthetic h:Ljava/lang/Object;

.field final synthetic i:LG/h$c;


# direct methods
.method constructor <init>(LG/h$c;LI/a;Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, LG/h$c$a;->i:LG/h$c;

    .line 2
    .line 3
    iput-object p2, p0, LG/h$c$a;->g:LI/a;

    .line 4
    .line 5
    iput-object p3, p0, LG/h$c$a;->h:Ljava/lang/Object;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public run()V
    .locals 1

    .line 1
    iget-object v0, p0, LG/h$c$a;->g:LI/a;

    .line 2
    .line 3
    iget-object p0, p0, LG/h$c$a;->h:Ljava/lang/Object;

    .line 4
    .line 5
    invoke-interface {v0, p0}, LI/a;->accept(Ljava/lang/Object;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
