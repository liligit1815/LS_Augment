.class Landroidx/activity/h$a$a;
.super Ljava/lang/Object;
.source "ComponentActivity.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Landroidx/activity/h$a;->f(ILd/a;Ljava/lang/Object;Landroidx/core/app/c;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic g:I

.field final synthetic h:Ld/a$a;

.field final synthetic i:Landroidx/activity/h$a;


# direct methods
.method constructor <init>(Landroidx/activity/h$a;ILd/a$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/activity/h$a$a;->i:Landroidx/activity/h$a;

    .line 2
    .line 3
    iput p2, p0, Landroidx/activity/h$a$a;->g:I

    .line 4
    .line 5
    iput-object p3, p0, Landroidx/activity/h$a$a;->h:Ld/a$a;

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
    .locals 2

    .line 1
    iget-object v0, p0, Landroidx/activity/h$a$a;->i:Landroidx/activity/h$a;

    .line 2
    .line 3
    iget v1, p0, Landroidx/activity/h$a$a;->g:I

    .line 4
    .line 5
    iget-object p0, p0, Landroidx/activity/h$a$a;->h:Ld/a$a;

    .line 6
    .line 7
    invoke-virtual {p0}, Ld/a$a;->a()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {v0, v1, p0}, Lc/d;->c(ILjava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    return-void
.end method
