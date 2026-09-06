.class final Lcom/android/launcher3/globalsearch/g$c;
.super Lcom/android/launcher3/globalsearch/g$b;
.source "GSRecommendApp.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/android/launcher3/globalsearch/g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "c"
.end annotation


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 3

    .line 1
    const/4 v0, 0x2

    .line 2
    const-string v1, "icontitle"

    .line 3
    .line 4
    const-string v2, "app_title.db"

    .line 5
    .line 6
    invoke-direct {p0, p1, v2, v0, v1}, Lcom/android/launcher3/globalsearch/g$b;-><init>(Landroid/content/Context;Ljava/lang/String;ILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method protected d(Landroid/database/sqlite/SQLiteDatabase;)V
    .locals 0

    .line 1
    const-string p0, "CREATE TABLE IF NOT EXISTS icontitle (componentName TEXT NOT NULL, installedTime INTEGER NOT NULL DEFAULT 0, lastUpdated TEXT, recommend_index INTEGER NOT NULL DEFAULT 0, label TEXT, pinyin_full TEXT, pinyin_header TEXT, search_key TEXT, is_quick_app INTEGER NOT NULL DEFAULT 0, intent TEXT, PRIMARY KEY (componentName) );"

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
