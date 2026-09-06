.class Ls1/n$b;
.super Ljava/lang/Object;
.source "DynamicIconResourceMfv.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ls1/n;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0xa
    name = "b"
.end annotation


# instance fields
.field private a:Ljava/lang/String;

.field private b:Landroid/content/ComponentName;


# direct methods
.method constructor <init>(Landroid/content/ComponentName;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ls1/n$b;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p1, p0, Ls1/n$b;->b:Landroid/content/ComponentName;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ls1/n$b;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
