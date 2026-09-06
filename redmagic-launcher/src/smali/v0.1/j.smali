.class public final synthetic Lv0/j;
.super Ljava/lang/Object;
.source "R8$$SyntheticClass"

# interfaces
.implements Ljava/util/concurrent/Callable;


# instance fields
.field public final synthetic a:Ljava/io/InputStream;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Ljava/io/InputStream;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lv0/j;->a:Ljava/io/InputStream;

    .line 5
    .line 6
    iput-object p2, p0, Lv0/j;->b:Ljava/lang/String;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Lv0/j;->a:Ljava/io/InputStream;

    .line 2
    .line 3
    iget-object p0, p0, Lv0/j;->b:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Lv0/p;->d(Ljava/io/InputStream;Ljava/lang/String;)Lv0/v;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method
