.class public final synthetic Lv0/i;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Landroid/content/Context;

.field public final synthetic b:Ljava/lang/String;

.field public final synthetic c:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lv0/i;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Lv0/i;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p3, p0, Lv0/i;->c:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 2

    .line 1
    iget-object v0, p0, Lv0/i;->a:Landroid/content/Context;

    .line 2
    .line 3
    iget-object v1, p0, Lv0/i;->b:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Lv0/i;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {v0, v1, p0}, Lv0/p;->b(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Lv0/v;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
