.class public LN1/f$a;
.super Ljava/util/ArrayList;
.source "ShortcutRequest.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = LN1/f;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/ArrayList<",
        "Landroid/content/pm/ShortcutInfo;",
        ">;"
    }
.end annotation


# static fields
.field static final h:LN1/f$a;


# instance fields
.field private final g:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, LN1/f$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, LN1/f$a;-><init>(Z)V

    .line 5
    .line 6
    .line 7
    sput-object v0, LN1/f$a;->h:LN1/f$a;

    .line 8
    .line 9
    return-void
.end method

.method constructor <init>(Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Landroid/content/pm/ShortcutInfo;",
            ">;)V"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 1
    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    :cond_0
    invoke-direct {p0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, LN1/f$a;->g:Z

    return-void
.end method

.method constructor <init>(Z)V
    .locals 0

    .line 3
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    iput-boolean p1, p0, LN1/f$a;->g:Z

    return-void
.end method


# virtual methods
.method public m()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, LN1/f$a;->g:Z

    .line 2
    .line 3
    return p0
.end method
