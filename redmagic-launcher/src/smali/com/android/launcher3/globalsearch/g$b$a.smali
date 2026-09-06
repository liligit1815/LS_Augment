.class Lcom/android/launcher3/globalsearch/g$b$a;
.super Lcom/android/launcher3/util/E1;
.source "GSRecommendApp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/globalsearch/g$b;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "a"
.end annotation


# instance fields
.field final synthetic h:Lcom/android/launcher3/globalsearch/g$b;


# direct methods
.method public constructor <init>(Lcom/android/launcher3/globalsearch/g$b;Landroid/content/Context;Ljava/lang/String;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/launcher3/globalsearch/g$b$a;->h:Lcom/android/launcher3/globalsearch/g$b;

    .line 2
    .line 3
    invoke-direct {p0, p2, p3, p4}, Lcom/android/launcher3/util/E1;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method private d(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "DROP TABLE IF EXISTS "

    .line 7
    .line 8
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    iget-object v1, p0, Lcom/android/launcher3/globalsearch/g$b$a;->h:Lcom/android/launcher3/globalsearch/g$b;

    .line 12
    .line 13
    invoke-static {v1}, Lcom/android/launcher3/globalsearch/g$b;->a(Lcom/android/launcher3/globalsearch/g$b;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-virtual {p1, v0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lcom/android/launcher3/globalsearch/g$b$a;->onCreate(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method


# virtual methods
.method public onCreate(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/android/launcher3/globalsearch/g$b$a;->h:Lcom/android/launcher3/globalsearch/g$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/android/launcher3/globalsearch/g$b;->d(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public onDowngrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0

    .line 1
    if-eq p2, p3, :cond_0

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/launcher3/globalsearch/g$b$a;->d(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method

.method public onUpgrade(Landroid/database/sqlite/SQLiteDatabase;II)V
    .locals 0

    .line 1
    if-eq p2, p3, :cond_0

    .line 2
    .line 3
    invoke-direct {p0, p1}, Lcom/android/launcher3/globalsearch/g$b$a;->d(Landroid/database/sqlite/SQLiteDatabase;)V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method
